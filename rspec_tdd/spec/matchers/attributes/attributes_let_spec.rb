require 'people'

describe 'Attributes' do
  let(:people) { People.new }

  it "have_attributes" do
    people.name = 'Rafa'
    people.age = 27

    expect(people).to have_attributes(name: a_string_starting_with('R'), age: (a_value >= 27))
  end
end