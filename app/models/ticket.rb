class Ticket < ActiveRecord::Base
  validates :title, :description, :property_tenant, presence: true
  belongs_to :property_tenant
  has_one :tenant, through: :property_tenant
  has_one :landlord, through: :property_tenant
  has_many :comments, as: :commentable
  scope :active, -> { where(status: true )}
  has_many :pictures

  def open?
    self.status
  end

  def close
    self.status = false
  end

  def show_status
    if self.status
      'Open'
    else
      'Close'
    end
  end


end
