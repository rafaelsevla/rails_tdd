describe 'Double Test' do
  it '--' do
    user = double('User')
    allow(user).to receive_messages(name: 'John')

    user.name
  end

  it '--' do
    user = double('User')
    allow(user).to receive(:password).and_return('secret')

    user.password
  end
end