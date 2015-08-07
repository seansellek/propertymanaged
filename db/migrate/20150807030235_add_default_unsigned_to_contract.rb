class AddDefaultUnsignedToContract < ActiveRecord::Migration
  def change
    change_column :contracts, :signed, :boolean, default: false
  end
end
