namespace :tenant_invoices do
  desc "Prepares invoices for the month"
  task prepare_invoices: :environment do
    PropertyTenant.generate_invoices
  end

  desc "Fires notifications for approaching unpaid invoices"
  task send_reminders: :environment do
    
  end

end
