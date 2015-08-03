class AddDefaultStatusToTicket < ActiveRecord::Migration
  def change
    change_column :tickets, :status, :boolean, default: true
  end
end
