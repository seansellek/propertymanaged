class RemoveForeignKeys < ActiveRecord::Migration
  def change
    remove_foreign_key "contracts", "property_tenants"

    remove_foreign_key "invites", "landlords"

    remove_foreign_key "invites", "properties"

    remove_foreign_key "invites", "tenants"

    remove_foreign_key "invoices", "property_tenants"

    remove_foreign_key "occupancy_pictures", "property_tenants"

    remove_foreign_key "pictures", "tickets"

    remove_foreign_key "properties", "landlords"

    remove_foreign_key "property_tenants", "properties"

    remove_foreign_key "property_tenants", "tenants"

    remove_foreign_key "tickets", "property_tenants"

  end
end
