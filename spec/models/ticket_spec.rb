require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let(:propertytenant) {create :property_tenant}
  let(:ticket) { create :ticket }
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

  it 'responds to open?' do
    expect(ticket).to respond_to(:open?)
  end

  it 'defaults to open' do
    expect(ticket.open?).to be == true
  end

  it 'can close' do
    expect(ticket).to respond_to(:close)
    ticket.close
    expect(ticket.open?).to be false
  end


end
