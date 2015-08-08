class Landlord < ActiveRecord::Base
  include Gravatar
  has_many :properties
  has_many :invites
  has_many :property_tenants, through: :properties
  has_many :contracts, through: :property_tenants
  has_many :tickets, through: :property_tenants
  has_many :invoices, through: :property_tenants
  has_secure_password

  def unpaid_invoices 
    invoices.where(paid: false)
  end
  def open_requests
    tickets.where(status: true)
  end
  def active_contracts
    # byebug
    contracts.signed.joins(:property_tenant).where(property_tenants: { active: true })
  end

  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :name, presence: true
  validates :password, confirmation: true, :length => {minimum: 8, message: 'is too short (minimum is 8 characters)'}
  validates :password_confirmation, presence: true
  validates :email, format: { :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/ }
end
