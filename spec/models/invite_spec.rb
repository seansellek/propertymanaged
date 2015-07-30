require 'rails_helper'

RSpec.describe Invite, type: :model, invite_system: true do
  it {should belong_to :landlord}
  it {should belong_to :tenant}
  it {should belong_to :property}
end
