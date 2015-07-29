class AddPasswordDigestToLandlord < ActiveRecord::Migration
  def change
    add_column :landlords, :password_digest, :string
  end
end
