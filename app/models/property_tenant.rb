class PropertyTenant < ActiveRecord::Base
  belongs_to :property
  belongs_to :tenant
  has_many :tickets
  has_many :occupancy_pictures
  has_many :invoices
  has_one :landlord, through: :property

  validates :duedate, numericality: { less_than: 29, greater_than: 0}
  validate :one_active_per_tenant, :one_active_per_property
  # validates :active, uniqueness: { scope: :tenant }
   # validates :active, uniqueness: { scope: :property }


  def invoice
    if !self.invoices.last || self.invoices.last.duedate.month != Date.today.month
      self.invoices.create(amount: self.rate, duedate: this_month_duedate)
    end
  end

  def self.generate_invoices
    self.where(active: true).each do |occupancy|
      occupancy.invoice
    end
  end

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

  def this_month_duedate
    beginning_of_month = Date.today.beginning_of_month
    due = (self.duedate - 1).days
    beginning_of_month + due
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
