$counter = 0

describe 'let' do
  let(:counter) { $counter += 1 }

  it "memorizes the value" do
    expect(counter).to eq(1) # 1a vez é carregado
    expect(counter).to eq(1) # 2a vez usa o valor em cache
  end

  it "its not cached between tests" do
    expect(counter).to eq(2) # Novo teste, novo valor
  end
end