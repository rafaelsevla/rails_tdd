describe 'Matchers de Comparação' do
  it '>' do
    expect(5).to be > 1
  end

  it '>=' do
    expect(5).to be >= 2
    expect(5).to be >= 5
  end

  it '<' do
    expect(5).to be < 6
  end

  it '<=' do
    expect(5).to be <= 12
    expect(5).to be <= 5
  end

  it 'be_between inclusive' do
    expect(5).to be_between(2,7).inclusive
    expect(2).to be_between(2,7).inclusive
    expect(7).to be_between(2,7).inclusive
  end

  # it 'be_between inclusive / Aggregate failures', :aggregate_failures do
  #   expect(5).to be_between(2,7).inclusive
  #   expect(1).to be_between(2,7).inclusive # esse teste falha
  #   expect(8).to be_between(2,7).inclusive # esse teste falha
  # end

  it 'be_between exclusive' do
    expect(5).to be_between(2,7).exclusive
    expect(3).to be_between(2,7).exclusive
    expect(6).to be_between(2,7).exclusive
    expect(2).not_to be_between(2,7).exclusive
    expect(7).not_to be_between(2,7).exclusive
  end

  it "match" do
    expect("bruce@wayne.com.br").to match(/..@../)
  end

  it "start_with" do 
    expect("fulano de tal").to start_with("fulano")
    expect([ 1, 2, 3 ]).to start_with(1)
  end

  it "end_with" do 
    expect("tal de tal").to end_with("tal")
    expect([ 1, 2, 3 ]).to end_with(3)
  end
end