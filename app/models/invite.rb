class Invite < ActiveRecord::Base
  belongs_to :property
  belongs_to :landlord
  belongs_to :tenant

  before_create :generate_token

  def generate_token
    self.token = Digest::SHA1.hexdigest([self.property_id, Time.now, rand].join)
  end  
end
