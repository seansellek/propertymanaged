class Tenant < ActiveRecord::Base
	has_secure_password
	has_many :property_tenants
	has_many :properties, through: :property_tenants
  has_many :invites

  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  validates :password, length: { :minimum => 8, :message => "password is too short" }
  validates :name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }

  def current_occupancy
    #how to validate that only one Occupancy is active for a tenant
    #or better handled by a seperate association
    #can two models be connected in different associations?
    self.property_tenants.find(active: true)
  end

end
