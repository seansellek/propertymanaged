class AddNameAndEmailToTenant < ActiveRecord::Migration
  def change
    add_column :tenants, :name, :string
    add_column :tenants, :email, :string
  end
end
