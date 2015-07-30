class Landlord < ActiveRecord::Base
  has_many :properties
  has_secure_password 

  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
end
