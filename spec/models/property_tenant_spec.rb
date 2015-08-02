require 'rails_helper'

RSpec.describe PropertyTenant, type: :model do
  let(:property_tenant) { build :property_tenant }
  subject { property_tenant }

  it { should belong_to :property }
  it { should belong_to :tenant }
  
end
