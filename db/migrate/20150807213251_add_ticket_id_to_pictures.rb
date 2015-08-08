class AddTicketIdToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :ticket_id, :integer
  end
end
