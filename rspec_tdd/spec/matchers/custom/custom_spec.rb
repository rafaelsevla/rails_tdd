RSpec::Matchers.define :be_a_multiple_of do |expected|
  # expected == 3
  # current = subject == 18
  match do |current| 
    current % expected == 0
  end

  failure_message do |current|
    "expected that #{current} would be a multiple of #{expected}"
  end

  description do
    "be a multiple of #{expected}"
  end
end

describe 18, 'Custom Matcher' do
  it { is_expected.to be_a_multiple_of(3) }
end

describe 'Custom Matcher' do
  it { expect(18).to be_a_multiple_of(3) }
end