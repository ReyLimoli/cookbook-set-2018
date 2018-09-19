require 'rails_helper'

feature 'User login' do
  scenario 'successfully' do
    User.create(email: 'reynaldo@gmail.com', password: '12345678')

    visit root_path

    click_on 'Entrar'

    fill_in "Email", with: "reynaldo@gmail.com"
    fill_in "Senha", with: "12345678"
    within '.actions' do
      click_on 'Entrar'
    end
    
    expect(current_path).to eq root_path
    expect(page).not_to have_link('Entrar')
    expect(page).to have_link('Sair')
    expect(page).to have_content('Olá reynaldo@gmail.com')
  end
  
  scenario 'User logout' do
    User.create(email: 'reynaldo@gmail.com', password: '12345678')

    visit root_path

    click_on 'Entrar'

    fill_in "Email", with: "reynaldo@gmail.com"
    fill_in "Senha", with: "12345678"
    within '.actions' do
      click_on 'Entrar'
    end
    
    click_on 'Sair'

    expect(current_path).to eq root_path
    expect(page).not_to have_link('Sair')
    expect(page).to have_link('Entrar')
    
  end
end