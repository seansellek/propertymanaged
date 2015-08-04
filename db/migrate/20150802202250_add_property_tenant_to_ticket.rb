class AddPropertyTenantToTicket < ActiveRecord::Migration
  def change
    
    remove_foreign_key :property_tenants, :ticket
    remove_column :property_tenants, :ticket_id
    add_reference :tickets, :property_tenant, index: true, foreign_key: true
  end
end
