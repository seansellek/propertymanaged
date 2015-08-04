class AddActiveToPropertyTenants < ActiveRecord::Migration
  def change
    add_column :property_tenants, :active, :boolean, default: true
  end
end
