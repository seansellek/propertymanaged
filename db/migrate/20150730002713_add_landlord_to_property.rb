class AddLandlordToProperty < ActiveRecord::Migration
  def change
    add_reference :properties, :landlord, index: true, foreign_key: true
  end
end
