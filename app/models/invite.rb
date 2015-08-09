class Invite < ActiveRecord::Base
  belongs_to :property
  belongs_to :landlord
  belongs_to :tenant
  before_save :check_user_existence

  before_create :generate_token

  def generate_token
    self.token = Digest::SHA1.hexdigest([self.property_id, Time.now, rand].join)
  end

  def check_user_existence
    recipient = Tenant.find_by(email: email)
   if recipient
      self.tenant = recipient
   end
  end

end
