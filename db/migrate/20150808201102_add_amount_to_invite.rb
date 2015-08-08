class AddAmountToInvite < ActiveRecord::Migration
  def change
    add_column :invites, :amount, :integer
  end
end
