class AddNameToLandlord < ActiveRecord::Migration
  def change
    add_column :landlords, :name, :string
  end
end
