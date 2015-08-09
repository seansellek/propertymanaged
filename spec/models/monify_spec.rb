require 'rails_helper'


RSpec.describe Monify do
  include Monify
  it 'returns 100 from $1.00' do
    expect(money_to_i('$1.00')).to be==100
  end
  it 'returns 1200000 from $12,000.00' do
    expect(money_to_i('$12,000.00')).to be == 1200000
  end
  it 'returns $1.00 from 100' do
    expect(i_to_money(100)).to be == '$1.00'
  end
  it 'returns $12,000.00 from 1200000' do
    expect(i_to_money(1200000)).to be == '$12,000.00'
  end
  it 'returns $5,000,000.00 from 500000000' do
    expect(i_to_money(500000000)).to be == '$5,000,000.00'
  end
  it 'returns $5,000,000,000.00 from 500000000000' do
    expect(i_to_money(500000000000)).to be == '$5,000,000,000.00'
  end

end
