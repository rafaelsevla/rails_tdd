require 'rails_helper'

RSpec.describe Customer, type: :model do

  it 'Create a customer' do
    customer = create(:customer)

    expect(customer.full_name).to eq('Sr. Bruce Wayne')
    expect(customer.email).to eq('bruce.wayne@example.com')
  end
end
