class AddSignatureIdToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :signature_id, :string
  end
end
