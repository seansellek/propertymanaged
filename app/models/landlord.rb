class Landlord < ActiveRecord::Base
  has_many :properties
  has_secure_password

  # validates :email, presence: true
  # validates :name, presence: true
  # validates :password, confirmation: true, :length => {minimum: 8, message: 'password is too short'}
  # validates :password_confirmation, presence: true
  # validates_uniqueness_of :email, :case_sensitive => false
  #
  #
  #
  #
  #
  # validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
end
