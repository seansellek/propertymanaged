require 'rails_helper'

RSpec.describe OccupancyPicture, type: :model do
  let(:propertytenant) {create :property_tenant}
  let(:occupancypicture ) { create :occupancy_picture }
  
  
  subject { occupancypicture }

  it "has occupancypicture properties" do
    subject.should respond_to(:caption)
  end

  it { should belong_to :property_tenant}

  it { should validate_presence_of(:image) }

end