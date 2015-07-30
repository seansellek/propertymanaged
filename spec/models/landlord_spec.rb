require 'rails_helper'

RSpec.describe Landlord, type: :model do
  let(:landlord) { build :landlord }
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

end
