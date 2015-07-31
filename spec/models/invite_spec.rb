require 'rails_helper'

RSpec.describe Invite, type: :model, invite_system: true do
  let(:invite) { create :invite }
  subject{ invite }

  it {should belong_to :landlord}
  it {should belong_to :tenant}
  it {should belong_to :property}

  it 'should generate a token on create' do
    expect(subject.token).to_not be_nil
  end
  
end
