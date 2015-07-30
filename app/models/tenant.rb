class Tenant < ActiveRecord::Base
	has_secure_password
	has_many :property_tenants
	has_many :properties, through: :property_tenants

  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  validates :password, length: { :minimum => 8, :message => "password is too short" }
  validates :name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
end
