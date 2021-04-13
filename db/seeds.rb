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
recipe2 = Recipe.create!(title: 'pizza', description: 'pizza pizza', ingredients: 'dough, pizza sauce, cheese', instructions: 'bake!', img_url: 'https://relish.com/cdn-cgi/image/fit=cover,f=auto,dpr=2,w=254,h=330/https://cookieandkate.com/images/2018/10/greek-pizza-recipe-2.jpg', recipe_creator_id: user3.id)
recipe3 = Recipe.create!(title: 'sauce', description: 'best marinara!', ingredients: 'canned tomato, olive oil, oregano', instructions: 'simmer for hours!', img_url: 'https://relish.com/cdn-cgi/image/fit=cover,f=auto,dpr=2,w=254,h=330/https://www.seriouseats.com/recipes/images/2011/08/20110814-166086-marinara.jpg', recipe_creator_id: user3.id)
recipe4 = Recipe.create!(title: 'pasta al limone', description: '"easy and delicious!"', ingredients: 'pasta lemon cheese', instructions: 'boil pasta add lemon and cheese', img_url: 'https://assets.bonappetit.com/photos/5b9a901947aaaf7cd9ea90f2/1:1/w_2560%2Cc_limit/ba-recipe-pasta-al-limone.jpg', recipe_creator_id: user2.id)
recipe5 = Recipe.create!(title: 'baked ziti', description: 'amazing baked ziti!', ingredients: 'pasta sauce cheese', instructions: 'bake', img_url: 'https://cdn.loveandlemons.com/wp-content/uploads/2019/12/baked-ziti.jpg', recipe_creator_id: user2.id)

FavoriteRecipe.create!(recipe_liker_id: user2.id, recipe_id: recipe2.id, recipe_name: recipe2.title, recipe_img: recipe2.img_url, favorited: true)
FavoriteRecipe.create!(recipe_liker_id: user1.id, recipe_id: recipe2.id, recipe_name: recipe2.title, recipe_img: recipe2.img_url, favorited: true)
FavoriteRecipe.create!(recipe_liker_id: user1.id, recipe_id: recipe3.id, recipe_name: recipe3.title, recipe_img: recipe3.img_url, favorited: true)