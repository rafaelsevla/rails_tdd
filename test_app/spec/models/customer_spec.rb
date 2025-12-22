require 'rails_helper'

RSpec.describe Customer, type: :model do
  it 'Create a customer' do
    subject.name = 'Jack Sparrow'
    subject.email = 'jack.sparrow@example.com'
    subject.save
    expect(subject.name).to eq('Jack Sparrow')
    expect(subject.email).to eq('jack.sparrow@example.com')
  end
end
