require 'rails_helper'

RSpec.describe Landlord, type: :model do
  let(:landlord) { create :landlord }
  let(:occupancy) { create :property_tenant }
  let(:invoice) {create :invoice}

  subject { landlord }

  it_behaves_like 'a user' do
    let(:user2) {build :landlord}
  end

  context "has correct associations" do
    it { should have_many :properties }
  end

  context 'can send invites', invite_system: true do
    it { should have_many :invites }
  end

  it '.payments_waiting reports total unpaid invoices' do
    occupancy.landlord = landlord
    occupancy.save
    invoice.property_tenant = occupancy
    invoice.save
    expect(landlord.unpaid_invoices).to include(invoice)
  end

  it '.open_tickets reports open tickets' do
    occupancy.landlord = landlord
    ticket = create :ticket, property_tenant: occupancy
    ticket2 = create :ticket, property_tenant: occupancy
    ticket = create :ticket
    expect(landlord.open_requests.length).to be == 2
  end
  it '.active_contracts reports active contracts' do
    occupancy.landlord = landlord
    contract = create :contract, property_tenant: occupancy
    contract.signed = true
    contract.save
    expect(landlord.active_contracts).to include(contract)


  end

end
