class PropertyTenant < ActiveRecord::Base
  belongs_to :property
  belongs_to :tenant
  has_many :tickets
  has_one :landlord, through: :property

  validate :one_active_per_tenant, :one_active_per_property
  # validates :active, uniqueness: { scope: :tenant }
   # validates :active, uniqueness: { scope: :property }



   private

  def one_active_per_tenant
    if PropertyTenant.where(tenant_id: self.tenant_id).where(active: true).empty?
      return true
    elsif self.active || self.active.nil?
      errors.add(:active, 'A tenant can only have one active Occupancy')
    else
      return true
    end
  end

  def one_active_per_property
    if PropertyTenant.where(property_id: self.property_id).where(active: true).empty?
      return true 
    elsif self.active || self.active.nil?
      errors.add(:active, 'A property can only have one active Ocupancy')
    else
      return true
    end
  end

end
