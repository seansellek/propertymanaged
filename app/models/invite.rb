class Invite < ActiveRecord::Base
  belongs_to :property
  belongs_to :landlord
  belongs_to :tenant
end
