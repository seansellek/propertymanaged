class AddLastNotifiedToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :last_notified, :datetime
  end
end
