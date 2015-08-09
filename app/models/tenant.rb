class Tenant < ActiveRecord::Base
  include Gravatar
	has_secure_password
  has_many :property_tenants
	has_many :properties, through: :property_tenants
  has_many :invites
  has_many :comments, as: :author
  has_many :contracts, through: :property_tenants

  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  validates :password, length: { :minimum => 8, :message => "password is too short" }
  validates :name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }

  def current_occupancy
    self.property_tenants.where(active: true).first
  end

  def active_contracts
    # byebug
    contracts.signed.joins(:property_tenant).where(property_tenants: { active: true }).first
  end

end
