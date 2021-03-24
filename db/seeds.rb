# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Recipe.destroy_all
User.destroy_all
FavoriteRecipe.destroy_all


user1 = User.create!(name: 'Cathy', username:'catd825', password_digest: 'password', bio: 'i love to cook!!')
user2 = User.create!(name: 'David', username:'ddubbs87', password_digest: 'password', bio: 'i dont love to cook!!')
user3 = User.create!(name: 'Mom', username:'Nonna1956', password_digest: 'password', bio: 'i <3 italian food')

recipe1 = Recipe.create!(title: 'pasta', description: 'basic pasta recipe', ingredients: '1 lb of pasta', instructions: 'boi l water, add pasta, cook for 8 min, then drain, add toppings, and serve', img_url: 'https://pinchofyum.com/wp-content/uploads/Vegan-Vodka-Pasta-Square.jpg', recipe_creator_id: user3.id)
recipe2 = Recipe.create!(title: 'pizza', description: 'pizza pizza', ingredients: 'dough, pizza sauce, cheese', instructions: 'bake!', img_url: '', recipe_creator_id: user3.id)
recipe3 = Recipe.create!(title: 'sauce', description: 'best marinara!', ingredients: 'canned tomato, olive oil, oregano', instructions: 'simmer for hours!', img_url: '', recipe_creator_id: user3.id)

FavoriteRecipe.create!(recipe_liker_id: user2.id, recipe_id: recipe2.id, favorited: true)
FavoriteRecipe.create!(recipe_liker_id: user1.id, recipe_id: recipe2.id, favorited: true)
FavoriteRecipe.create!(recipe_liker_id: user1.id, recipe_id: recipe3.id, favorited: true)