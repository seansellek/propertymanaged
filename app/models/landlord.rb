class Landlord < ActiveRecord::Base
  has_many :properties
  has_secure_password

  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :name, presence: true
  validates :password, confirmation: true, :length => {minimum: 8, message: 'is too short (minimum is 8 characters)'}
  validates :password_confirmation, presence: true
  validates :email, format: { :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/ }
end
