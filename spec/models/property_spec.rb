require 'rails_helper'

RSpec.describe Property, type: :model do

  it {should respond_to(:name)}
  it "has address properties" do
    subject.should respond_to(:address1)
    subject.should respond_to(:address2)
    subject.should respond_to(:city)
    subject.should respond_to(:state)
    subject.should respond_to(:zip)
  # its(:address) {should}
end

end
