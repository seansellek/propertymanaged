require 'rails_helper'

RSpec.describe Picture, type: :model do
  let(:propertytenant) {create :property_tenant}
  let(:ticket) { create :ticket }
  let(:picture) { create :picture }
  subject { picture }

  it "has picture properties" do
    subject.should respond_to(:caption)
  end

  it { should belong_to :ticket }

  it { should validate_presence_of(:image) }

end