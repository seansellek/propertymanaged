require 'rails_helper'

RSpec.describe PropertyTenant, type: :model do
  let(:property) { Property.new }
  let(:tenant) { Tenant.new }
  let(:propertytenant) {PropertyTenant.new(property: property, tenant: tenant)}
  subject { propertytenant }

  it 'includes Property & Tenant' do
    subject.property.should be == property
    subject.tenant.should be == tenant
  end
end
