require 'rails_helper'

RSpec.describe PropertyTenant, type: :model do
  let(:property_tenant) { create :property_tenant }
  subject { property_tenant }

  it { should belong_to :property }
  it { should belong_to :tenant }
  it { should respond_to :active }
  its(:active) { should be true}

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

end
