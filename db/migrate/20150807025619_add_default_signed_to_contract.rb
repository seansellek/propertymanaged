class AddDefaultSignedToContract < ActiveRecord::Migration
  def change
    change_column :contracts, :signed, :boolean, default: true
  end
end
