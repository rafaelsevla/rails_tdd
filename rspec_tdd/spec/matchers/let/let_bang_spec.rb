$count = 0

describe "let!" do
  invocation_order = []

  let!(:count) do
    invocation_order << :let!
    $count += 1
  end

  it "is invoked before each example" do
    invocation_order << :example
    expect(invocation_order).to eq([:let!, :example])
    expect(count).to eq($count)
  end
end