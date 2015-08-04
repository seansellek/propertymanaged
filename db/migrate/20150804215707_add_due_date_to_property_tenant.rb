class AddDueDateToPropertyTenant < ActiveRecord::Migration
  def change
    add_column :property_tenants, :duedate, :integer, default: 28
  end
end
