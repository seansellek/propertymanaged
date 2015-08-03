class Ticket < ActiveRecord::Base
  validates :title, :description, :status, presence: true
  belongs_to :property_tenant
end
