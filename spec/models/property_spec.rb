require 'rails_helper'

RSpec.describe Property, type: :model do
  let(:property) { Property.new(address1: "42 Wallaby Way", city: 'Sydney', state: 'Australia', zip: '33130')}
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


end


# it 'include tweets' do
#     tweet1 = Tweet.new(status: 'Uuuuunhhhhh')
#     tweet2 = Tweet.new(status: 'Arrrrgggg')
#     zombie = Zombie.new(name: 'Ash', tweets: [tweet1, tweet2])
#     zombie.tweets.should include(tweet1)
#     zombie.tweets.should include(tweet2)
# ￼￼end
