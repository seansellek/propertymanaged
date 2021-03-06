require 'rails_helper'

RSpec.describe Property, type: :model do
  let(:property) { create :property }
  subject { property }

  it {should respond_to(:name)}
  it "has address properties" do
    subject.should respond_to(:address1)
    subject.should respond_to(:address2)
    subject.should respond_to(:city)
    subject.should respond_to(:state)
    subject.should respond_to(:zip)
  end

  its(:address) {should be == "42 Wallaby Way Sydney, Australia, 33130"}

  it { should have_many :property_tenants}

  it { should belong_to :landlord }

  it "reports current active occupancy" do
    occupancy = create :property_tenant
    property = occupancy.property
    expect(property.active_occupancy).to eq(occupancy)
  end
end
