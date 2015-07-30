require 'rails_helper'

RSpec.describe Property, type: :model do
  let(:propertytenant) { PropertyTenant.new }
  let(:property) { Property.new(address1: "42 Wallaby Way", city: 'Sydney', state: 'Australia', zip: '33130')}
  let(:landlord) {Landlord.new}
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

  it "should have PropertyTenants" do
    subject.property_tenants << propertytenant
    subject.property_tenants.should include(propertytenant)
  end

  it "should include Landlord" do
    subject.landlord = landlord
    subject.landlord.should be == landlord
  end
end



