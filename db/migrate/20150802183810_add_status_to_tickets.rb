class AddStatusToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :status, :boolean
  end
end
