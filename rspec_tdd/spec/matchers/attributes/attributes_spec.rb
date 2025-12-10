require 'people'

describe 'Attributes' do
  # before (:each) do
  #   @people = People.new
  # end

  # after(:each) do
  #   @people.name = "Sem nome!"
  #   puts ">>> #{@people.inspect}"
  # end

  around(:each) do |test|
    @people = People.new

    test.run

    @people.name = "Sem nome!"
    puts ">>> #{@people.inspect}"
  end

  context "have_attributes" do
    it 'simple' do
      @people.name = 'Rafa'
      @people.age = 27
  
      expect(@people).to have_attributes(name: "Rafa", age: 27)
    end
    it 'starting_with and be' do
      @people.name = 'Rafa'
      @people.age = 27
  
      expect(@people).to have_attributes(name: starting_with('R'), age: (be >= 27))
    end
    it 'a_string_starting_with and a_value' do
      @people.name = 'Rafa'
      @people.age = 27

      expect(@people).to have_attributes(name: a_string_starting_with('R'), age: (a_value >= 27))
    end
  end
end