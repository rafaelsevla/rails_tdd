require 'counter'

describe 'Change matcher' do
  it { expect { Counter.increment }.to change { Counter.quantity } }
  it { expect { Counter.increment }.to change { Counter.quantity }.by(1) }
  it { expect { Counter.increment }.to change { Counter.quantity }.from(2).to(3) }
end