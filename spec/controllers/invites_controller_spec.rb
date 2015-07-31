require 'rails_helper'

RSpec.describe InvitesController, type: :controller, invite_system: true do
  describe 'POST #create' do
    it 'Instantiates new invite' do
    it 'Associates invite with current user'
    it 'Makes call to InviteMailer on successful save'
  end
end
