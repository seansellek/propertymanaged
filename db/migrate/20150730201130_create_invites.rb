class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.string :email
      t.references :property, index: true, foreign_key: true
      t.references :landlord, index: true, foreign_key: true
      t.references :tenant, index: true, foreign_key: true
      t.string :token

      t.timestamps null: false
    end
  end
end
