class Ticket < ActiveRecord::Base
  validates :title, :description, :property_tenant, presence: true
  belongs_to :property_tenant
  has_one :tenant, through: :property_tenant
  has_one :landlord, through: :property_tenant
  scope :active, -> { where(status: true )}

  def open?
    self.status
  end

  def close
    self.status = false
  end
end
