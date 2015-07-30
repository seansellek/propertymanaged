require 'rails_helper'

RSpec.describe Tenant, type: :model do
  let(:propertytenant) { PropertyTenant.new }
  let(:tenant) {Tenant.new(name: 'Angelica', password: 'asdf') }
  subject { tenant }
  it "has a name" do
    subject.should respond_to(:name)
  end
  it "has an email" do
    subject.should respond_to(:email)
  end
  it { should have_secure_password }
  it { should have_many(:property_tenants) }
end
