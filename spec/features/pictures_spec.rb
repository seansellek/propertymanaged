require 'rails_helper'


RSpec.describe "Pictures CRUD:" do
  context 'When viewing pictures' do
    let(:landlord) { create :landlord }
    let(:picture) { create :picture }
    before do
      page.set_rack_session(user_id: landlord.id)
      page.set_rack_session(user_type: 'landlord')
      visit new_picture_path
    end

  describe Picture do
    it { should have_attached_file(:image) }
    it { should validate_attachment_presence(:image) }
    it { should validate_attachment_content_type(:image).
                allowing('image/png', 'image/gif').
                rejecting('text/plain', 'text/xml') }
    it { should validate_attachment_size(:image).
                less_than(2.megabytes) }
  end
end
end