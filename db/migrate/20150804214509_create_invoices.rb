class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.references :property_tenant, index: true, foreign_key: true
      t.integer :amount
      t.boolean :paid
      t.datetime :duedate

      t.timestamps null: false
    end
  end
end
