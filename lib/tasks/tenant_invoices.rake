namespace :tenant_invoices do
  desc "Prepares invoices for the month"
  task prepare_invoices: :environment do
    active_occupancies = PropertyTenant.where(active: true)
    InvoiceGenerator.generate(active_occupancies)
  end

  desc "Fires notifications for approaching unpaid invoices"
  task send_reminders: :environment do
  end

end
