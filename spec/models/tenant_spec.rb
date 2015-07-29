require 'rails_helper'

RSpec.describe Tenant, type: :model do
  let(:tenant) {Tenant.new(name: 'Angelica', password: 'asdf') }
  subject { tenant }
  it "has a name" do
    subject.should respond_to(:name)
  end
  it "has an email" do
    subject.should respond_to(:email)
  end
  it "stores an encrypted password" do
    subject.should respond_to(:password_digest)
    subject.password_digest.should_not be == 'asdf'
    subject.authenticat('fdsa').should_not be == subject
    subject.authenticate('asdf').should be == subject
  end
end
