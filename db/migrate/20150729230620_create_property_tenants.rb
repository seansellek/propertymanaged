class CreatePropertyTenants < ActiveRecord::Migration
  def change
    create_table :property_tenants do |t|
      t.references :property, index: true, foreign_key: true
      t.references :tenant, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
