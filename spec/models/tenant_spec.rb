require 'rails_helper'

RSpec.describe Tenant, type: :model do
  let (:propertytenant) { create :property_tenant }
  let(:tenant) { propertytenant.tenant }
  subject { tenant }

  it_behaves_like 'a user' do
    let(:user2) {build :tenant}
  end

  context 'has correct associations' do
    it { should have_many(:property_tenants) }
  end

  context 'can accept invites', invite_system: true do
    it { should have_many :invites }
  end
  it 'should respond to current_occupancy' do
    expect(tenant).to respond_to :current_occupancy
  end
  it 'current_occupancy should return current occupancy' do
    expect(tenant.current_occupancy ).to be == propertytenant
  end

end
