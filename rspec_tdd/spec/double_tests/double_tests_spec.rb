describe 'Double Test' do
  it 'name' do
    user = double('User')
    allow(user).to receive_messages(name: 'John')
    user.name
  end

  it 'password' do
    user = double('User')
    allow(user).to receive(:password).and_return('secret')
    user.password
  end

  it 'as_null_object' do
    user = double('User').as_null_object
    allow(user).to receive_messages(name: 'John')
    allow(user).to receive(:password).and_return('secret')
    user.name
    user.password
    user.abc # does not raise error
  end
end