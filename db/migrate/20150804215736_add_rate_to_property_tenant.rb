class AddRateToPropertyTenant < ActiveRecord::Migration
  def change
    add_column :property_tenants, :rate, :integer
  end
end
