require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order) { FactoryGirl.create :order }
  
  it 'allows valid order' do
    expect(order.valid?).to be_truthy
  end
  
  it 'disallows invalid email in order' do
    order.email = 'invalid@email,com'
    expect(order.valid?).to be false
  end
end
