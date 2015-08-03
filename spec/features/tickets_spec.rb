require 'rails_helper'

RSpec.describe "Properties CRUD:" do
  context 'When viewing dashboard' do
    let(:tenant) { create :tenant }
    before do
      page.set_rack_session(user_id: tenant.id)
      page.set_rack_session(user_type: 'tenant')
      visit dashboard_path
    end

    it 'displays create ticket link' do
      expect(page).to have_content('Create Ticket')
    end

    it 'and clicking create ticket link, takes you to tickets#new' do
      click_link('Create Ticket')
      expect(page).to have_content('New Ticket')
    end

    it 'and clicking link, displays form' do
      click_link('Create Ticket')

      expect(page).to have_field('Title:')
      expect(page).to have_field('Description:')
    end

    context 'when submitting property form' do
      before do
        visit new_ticket_path
        fill_in 'Title:', with: 'AC is not cooling'
        fill_in 'Description:', with: 'Air conditioner on but not blowing out cold air'
      end

    end
  end
end
