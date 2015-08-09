require 'rails_helper'

RSpec.describe PropertyTenant, type: :model do
  let(:property_tenant) { create :property_tenant }
  subject { property_tenant }

  it { should belong_to :property }
  it { should belong_to :tenant }
  it { should respond_to :active }
  it { should have_many :occupancy_pictures}
  it { should have_many :invoices}
  it { should respond_to :occupancy_pictures}
  its(:active) { should be true}

  it "only accepts duedate between 1-28" do
    property_tenant.duedate = 30
    expect(property_tenant.valid?).to be_falsey
    property_tenant.duedate = 0
    expect(property_tenant.valid?).to be_falsey
  end

  it "allows a tenant to have multiple innactive Occupancies" do
    tenant = property_tenant.tenant
    property_tenant.active = false
    property_tenant.save
    new_pt = PropertyTenant.new
    new_pt.active = false
    new_pt.tenant = tenant
    new_pt.save
    expect(new_pt.valid?).to be_truthy
  end

  it "does not allow a tenant to have multiple active Occupancies" do
    tenant = property_tenant.tenant
    new_pt = PropertyTenant.new
    new_pt.tenant = tenant
    new_pt.save
    expect(new_pt.valid?).to be_falsey
  end

  it "allows a property to have multiple innactive Occupancies" do
    property = property_tenant.property
    property_tenant.active = false
    property_tenant.save
    new_pt = PropertyTenant.new
    new_pt.property = property
    new_pt.active = false
    expect(new_pt.valid?).to be_truthy
  end

  it "does not allow a property to have multiple active Occupancies" do
    property = property_tenant.property
    new_pt = PropertyTenant.new
    new_pt.property = property
    new_pt.active = true
    expect(new_pt.valid?).to be_falsey
  end
  it "generates invoice on creation" do
    expect(property_tenant).to respond_to(:invoice)
    expect(property_tenant.invoices.first).to be_a(Invoice)
  end
  it 'generates an invoice for that month' do
    property_tenant.invoice
    expect(property_tenant.invoices.first.duedate.month).to be == Date.today.month
    expect(property_tenant.invoices.first.duedate.day).to be == property_tenant.duedate
  end
  it 'generates only one invoice per month' do
    property_tenant.invoice
    property_tenant.invoice
    expect(property_tenant.invoices.length).to be == 1
  end

  it 'generates invoices for all active occupancies' do
    create :property_tenant
    create :property_tenant
    create :property_tenant
    property_tenant.invoice
    PropertyTenant.generate_invoices
    expect(Invoice.all.length).to be == PropertyTenant.all.length
  end
  it 'retrieves open tickets' do
    ticket = create :ticket, property_tenant_id: property_tenant.id
    ticket2 = create :ticket, status: false, property_tenant_id: property_tenant.id
    expect(property_tenant.open_requests).to include(ticket)
    expect(property_tenant.open_requests).to_not include(ticket2)
  end
  pending'responds to paid? with payment status' do
    PropertyTenant.generate_invoices
    expect(property_tenant.paid).to be_falsey
  end

  # it "responds to invoiced? with true or false" do
  #   expect(property_tenant).to respond_to(:invoiced?)
  #   expected(property_tenant.invoiced?).to be_falsey
  #   property_tenant.invoice
  #   expect

  # end

end
