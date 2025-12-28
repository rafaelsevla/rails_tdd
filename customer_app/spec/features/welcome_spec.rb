require 'rails_helper'

RSpec.feature "Welcome", type: :feature do
  scenario "Display welcome message" do
    visit('/')
    expect(page).to have_content('Bem-Vindo')
  end
end
