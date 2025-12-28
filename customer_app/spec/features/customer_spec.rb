require 'rails_helper'

feature "Customers", type: :feature do
  scenario 'Check customer register link' do
    visit(root_path)
    expect(page).to have_link('Cadastro de Clientes')
  end

  scenario 'Check new customer link' do
    visit(root_path)
    click_on('Cadastro de Clientes')

    expect(page).to have_content('Listando clientes')
    expect(page).to have_link('Novo Cliente')
  end

  scenario 'Check new client form' do
    visit(customers_path)
    click_on('Novo Cliente')
    expect(page).to have_content('Novo Cliente')
  end

  scenario 'Register a new customer' do
    visit(new_customer_path)
    customer_name = Faker::Name.name

    fill_in('Nome', with: customer_name)
    fill_in('Email', with: Faker::Internet.email)
    fill_in('Telefone', with: Faker::PhoneNumber.phone_number)
    attach_file('Foto do Perfil', "#{Rails.root}/spec/fixtures/avatar.png")
    choose(option: [ 'N', 'S' ].sample)
    click_on('Criar Cliente')

    expect(page).to have_content('Cliente cadastrado com sucesso!')
    expect(Customer.last.name).to eq(customer_name)
  end

  scenario 'when try register invalid customer' do
    visit(new_customer_path)
    click_on('Criar Cliente')
    expect(page).to have_content('não pode ficar em branco')
  end
end
