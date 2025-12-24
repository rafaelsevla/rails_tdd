require 'rails_helper'

RSpec.describe Order, type: :model do
  context 'Customer' do
    it 'has a customer' do
      order = create(:order)
      expect(order.customer).to be_kind_of(Customer)
    end

    it 'has a customer by param' do
      customer = create(:customer)
      order = create(:order, customer: customer)
      expect(order.customer).to be_kind_of(Customer)
    end
  end
end
