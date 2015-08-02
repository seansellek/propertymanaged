class PropertyTenant < ActiveRecord::Base
  belongs_to :property
  belongs_to :tenant
  has_many :tickets
end
