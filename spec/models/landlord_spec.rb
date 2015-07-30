require 'rails_helper'

RSpec.describe Landlord, type: :model do
  let(:landlord) {Landlord.new(name: 'Ariel', password: 'asdf') }
  let(:property) { Property.new }
  subject { landlord }

  it "has a name" do
    subject.should respond_to(:name)
  end
  it "has an email" do
    subject.should respond_to(:email)
  end
  it { should have_secure_password }

  it { should have_many(:properties) }
end
