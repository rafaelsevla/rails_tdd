require 'people'

describe 'Attributes' do
  context "have_attributes" do
    it 'simple' do
      people = People.new
      people.name = 'Rafa'
      people.age = 27
  
      expect(people).to have_attributes(name: "Rafa", age: 27)
    end
    it 'starting_with and be' do
      people = People.new
      people.name = 'Rafa'
      people.age = 27
  
      expect(people).to have_attributes(name: starting_with('R'), age: (be >= 27))
    end
    it 'a_string_starting_with and a_value' do
      people = People.new
      people.name = 'Rafa'
      people.age = 27

      expect(people).to have_attributes(name: a_string_starting_with('R'), age: (a_value >= 27))
    end
  end
end