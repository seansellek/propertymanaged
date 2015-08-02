require 'rails_helper'

RSpec.describe Tenant, type: :model do
  let(:tenant) { build :tenant}
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

end
