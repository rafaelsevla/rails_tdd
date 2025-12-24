require 'rails_helper'

RSpec.describe Order, type: :model do
  context 'Customer' do
    it 'belongs_to' do
      order = create(:order)
      expect(order.customer).to be_kind_of(Customer)
    end

    it 'belongs_to (by param)' do
      customer = create(:customer)
      order = create(:order, customer: customer)
      expect(order.customer).to be_kind_of(Customer)
    end
  end

  it 'Has 3 orders - create_list' do
    orders = create_list(:order, 3)
    expect(orders.count).to eq(3)
  end

  it 'has_many' do
    customer = create(:customer, :with_orders, :quantitiy_orders => 5)
    # quantity_orders is 3 by default
    expect(customer.orders.count).to eq(5)
  end
end
