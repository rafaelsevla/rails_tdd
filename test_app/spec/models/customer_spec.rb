require 'rails_helper'

RSpec.describe Customer, type: :model do
  fixtures :customers

  it 'Create a customer' do
    customer = customers(:jack)

    expect(customer.full_name).to eq('Capitão Jack Sparrow')
    expect(customer.email).to eq('jack.sparrow@example.com')
  end
end
