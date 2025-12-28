require 'rails_helper'

RSpec.feature "Welcome", type: :feature do
  scenario "Display welcome message" do
    visit(root_path)
    expect(page).to have_content('Bem-Vindo')
  end

  scenario "Display login link" do
    visit(root_path)
    expect(find('ul li')).to have_link('Cadastro de Clientes')
  end
end
