require 'rails_helper'

RSpec.describe Landlord, type: :model do
  let(:landlord) {Landlord.new(name: 'Ariel', password: 'asdf') }
  subject { landlord }

  it "has a name" do
    subject.should respond_to(:name)
  end
  it "has an email" do
    subject.should respond_to(:email)
  end
  it "stores an encrypted password" do
    subject.should respond_to(:password_digest)
    subject.password_digest.should_not be == 'asdf'
    subject.authenticate('asdf').should be == subject
  end
end
