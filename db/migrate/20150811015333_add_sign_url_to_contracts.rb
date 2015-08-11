class AddSignUrlToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :sign_url, :string
  end
end
