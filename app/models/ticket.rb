class Ticket < ActiveRecord::Base
  validates :title, :description, :status, presence: true
  belongs_to :property_tenant

  def open?
    self.status
  end

  def close
    self.status = false
  end
end
