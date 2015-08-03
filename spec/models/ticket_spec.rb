require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let(:propertytenant) {PropertyTenant.new(property: property, tenant: tenant)}
  let(:ticket) { build :ticket }
  subject { ticket }

  it "has ticket properties" do
    subject.should respond_to(:title)
    subject.should respond_to(:description)
    subject.should respond_to(:status)
  end
  
  it { should belong_to(:property_tenant) }
  
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:status) }


end
