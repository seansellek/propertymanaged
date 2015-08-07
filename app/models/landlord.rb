class Landlord < ActiveRecord::Base
  has_many :properties
  has_many :invites
  has_many :property_tenants, through: :properties
  has_many :tickets, through: :property_tenants
  has_many :invoices, through: :property_tenants
  has_secure_password

  def unpaid_invoices 
    invoices.where(paid: false)
  end
  def open_requests
    tickets.where(status: true)
  end

  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :name, presence: true
  validates :password, confirmation: true, :length => {minimum: 8, message: 'is too short (minimum is 8 characters)'}
  validates :password_confirmation, presence: true
  validates :email, format: { :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/ }
  def get_email_hash
    email = self.email
    email.strip!
    Digest::MD5.hexdigest(email)
  end
end
