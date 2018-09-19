require 'rails_helper'

feature 'Administrator register cuisines' do 

  scenario 'successfully' do
    
    visit root_path

    click_on 'Cadastrar Cozinha'
    fill_in 'Nome', with: 'Brasileira'

    click_on 'Enviar'
    
    expect(page).to have_css('h1', text: 'Brasileira')
    expect(page).to have_content('Cozinha cadastrada com sucesso!')

  end

  scenario 'and must fill in name' do
    visit root_path
    click_on 'Cadastrar Cozinha'

    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Você deve informar o campo Nome')
  end

  scenario 'and must not register duplicate' do 
    
    Cuisine.create(name: 'Brasileira')

    visit root_path

    click_on 'Cadastrar Cozinha'
    fill_in 'Nome', with: 'Brasileira'

    click_on 'Enviar'
    
    expect(page).to have_content('Esta cozinha já foi cadastrada.')

  end

end