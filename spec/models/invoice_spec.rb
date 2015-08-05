require 'rails_helper'

RSpec.describe Invoice, type: :model do
  let(:inv1) { create :invoice, duedate: (Date.today + 3.weeks) }
  let(:inv2) { create :invoice, duedate: (Date.today + 2.weeks) }
  let(:inv3) { create :invoice, duedate: (Date.today - 1.day), last_notified: (Date.today - 3.weeks) }
  before(:each) do
      i = inv1
      j = inv2
      k = inv3
  end
    it 'returns invoices due in two weeks' do
      expect(Invoice.due_soon.length).to be == 2 
    end
    it 'sets last notified to current date' do
      expect(inv1.last_notified).to eq(Date.today)
    end
    it 'returns invoices due in two weeks and in need of reminder' do
      expect(Invoice.need_notification.length).to be == 1
    end



end
