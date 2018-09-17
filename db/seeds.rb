# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
recipe_type = RecipeType.create(name: 'Prato Principal')
cuisine = Cuisine.create(name: 'Brasileira')
Recipe.create(title: 'Feijoada', recipe_type: recipe_type, cuisine: cuisine,
              difficulty: 'Médio', cook_time: 120,
              ingredients: 'Feijão e carnes.',
              cook_method: 'Misturar o feijão com as carnes.', featured: true)

Recipe.create(title: 'Macarronada', recipe_type: recipe_type, cuisine: cuisine,
              difficulty: 'Fácil', cook_time: 30,
              ingredients: 'Macarrão e molho de tomate',
              cook_method: 'Cozinhar o macarrão e misturar com o molho.')
