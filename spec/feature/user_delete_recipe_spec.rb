require 'rails_helper'

feature 'user delete recipe' do
  scenario 'successfully' do
    user = User.create(email: 'reynaldo@gmail.com', password: '12345678')
    recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')
    Recipe.create(title: 'Bolo de cenoura', difficulty: 'Médio',
                  recipe_type: recipe_type, cuisine: cuisine,
                  cook_time: 50, ingredients: 'Farinha, açucar, cenoura',
                  cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes', 
                  user: user)

    visit root_path
    click_on 'Entrar'

    fill_in "Email", with: "reynaldo@gmail.com"
    fill_in "Senha", with: "12345678"
    within '.actions' do
      click_on 'Entrar'
    end

    click_on 'Bolo de cenoura'
    click_on 'Excluir receita'
    
    expect(current_path).to eq root_path
    expect(page).not_to have_content('Bolo de cenoura')
  end
end