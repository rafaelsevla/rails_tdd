require 'rails_helper'

RSpec.describe Customer, type: :model do

  it '#full_name' do
    customer = create(:customer)
    expect(customer.full_name).to start_with('Mr. ')
  end

  it '#full_name - override attribute' do
    customer = create(:customer, name: "Alice Kingsleigh")
    expect(customer.full_name).to start_with('Mr. ')
  end

  context 'HERANÇA' do
    it 'is a VIP customer - inheritance' do
      customer = create(:customer_vip)
      expect(customer.vip).to eq(true)
      expect(customer.days_to_pay).to eq(30)
    end
  
    it 'is a default customer' do
      customer = create(:customer_default)
      expect(customer.vip).to eq(false)
      expect(customer.days_to_pay).to eq(15)
    end
  end

  it { expect { create(:customer) }.to change { Customer.all.size }.by(1) }

  it 'Using attributes_for' do
    attrs = attributes_for(:customer)
    customer = Customer.new(attrs)
    expect(customer.name).to eq(attrs[:name])
    expect(customer.email).to eq(attrs[:email])
  end

  it 'Transient attributes' do
    customer = create(:customer, upcased: true)
    expect(customer.name.upcase).to eq(customer.name)
  end
end
