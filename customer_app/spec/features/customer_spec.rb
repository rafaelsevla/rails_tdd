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
end
