class AddPropertyTenantIdToOccupancyPictures < ActiveRecord::Migration
  def change
    add_column :occupancy_pictures, :property_tenant_id, :integer
    add_foreign_key :occupancy_pictures, :property_tenants
  end
end
