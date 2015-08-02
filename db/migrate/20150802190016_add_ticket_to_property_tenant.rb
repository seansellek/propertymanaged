class AddTicketToPropertyTenant < ActiveRecord::Migration
  def change
    add_reference :property_tenants, :ticket, index: true, foreign_key: true
  end
end
