class AddEmailToLandlord < ActiveRecord::Migration
  def change
    add_column :landlords, :email, :string
  end
end
