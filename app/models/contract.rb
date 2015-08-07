class Contract < ActiveRecord::Base
  belongs_to :property_tenant
  scope :signed, -> { where(signed: true)}
end
