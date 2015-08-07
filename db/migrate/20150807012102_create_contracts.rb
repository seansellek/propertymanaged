class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.references :property_tenant, index: true, foreign_key: true
      t.boolean :signed

      t.timestamps null: false
    end
  end
end
