require 'rails_helper'

RSpec.describe Tenant, type: :model do
  it "has a name" do
    subject.should respond_to(:name)
  end
  it "has an email" do
    subject.should respond_to(:email)
  end
  it "stores an encrypted password" do
    tenant = Tenant.new
    tenant.password = 'asdf'
    subject(tenant)
    subject.should respond_to(:password_digest)
    subject.password_digest.should_not be == 'asdf'
    subject.authenticate('asdf').should be_true
  end
end
