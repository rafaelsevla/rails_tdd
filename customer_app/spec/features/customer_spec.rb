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

  scenario 'Display a customer' do
    customer = Customer.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      smoker: [ 'N', 'S' ].sample,
      avatar: "#{Rails.root}/spec/fixtures/avatar.png"
    )

    visit(customer_path(customer.id))
    expect(page).to have_content(customer.name)
    expect(page).to have_content(customer.email)
    expect(page).to have_content(customer.phone)
  end

  scenario 'List customers on index' do
    customer1 = Customer.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      smoker: [ 'N', 'S' ].sample,
      avatar: "#{Rails.root}/spec/fixtures/avatar.png"
    )

    customer2 = Customer.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      smoker: [ 'N', 'S' ].sample,
      avatar: "#{Rails.root}/spec/fixtures/avatar.png"
    )

    visit(customers_path)
    expect(page).to have_content(customer1.name).and have_content(customer2.name)
  end

  scenario 'Update a customer' do
    customer = Customer.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      smoker: [ 'N', 'S' ].sample,
      avatar: "#{Rails.root}/spec/fixtures/avatar.png"
    )

    new_name = Faker::Name.name
    visit(edit_customer_path(customer.id))
    fill_in('Nome', with: new_name)
    click_on('Atualizar Cliente')

    expect(page).to have_content('Cliente atualizado com sucesso')
    expect(page).to have_content(new_name)
  end

  scenario 'Click on "show" link' do
    Customer.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      smoker: [ 'N', 'S' ].sample,
      avatar: "#{Rails.root}/spec/fixtures/avatar.png"
    )

    visit(customers_path)
    find(:xpath, "/html/body/table/tbody/tr[1]/td[2]/a").click
    expect(page).to have_content("Detalhamento do Cliente")
  end

  scenario 'Click on "edit" link' do
    Customer.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      smoker: [ 'N', 'S' ].sample,
      avatar: "#{Rails.root}/spec/fixtures/avatar.png"
    )

    visit(customers_path)
    find(:xpath, "/html/body/table/tbody/tr[1]/td[3]/a").click
    expect(page).to have_content("Editar Cliente")
  end
end
