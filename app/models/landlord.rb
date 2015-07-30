class Landlord < ActiveRecord::Base
  has_many :properties
  has_secure_password

  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :name, presence: true
  validates :password, confirmation: true, :length => {minimum: 8, message: 'password is too short'}
  validates :password_confirmation, presence: true
  validates :email, format: { :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/ }
end
