require 'json'
require 'open-uri'

Cocktail.destroy_all
Ingredient.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)

ingredients['drinks'].each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
end

url = 'https://cdn.liquor.com/wp-content/uploads/2018/09/04153106/mojito-720x720-recipe.jpg'
mojito = Cocktail.new(name: 'Mojito')
mojito.remote_photo_url = url
mojito.save

url = 'https://static.oldforester.com/app/uploads/2017/05/01201328/WhiskeySourEgg-Env.jpg'
whisky = Cocktail.new(name: 'Whisky Sour')
whisky.remote_photo_url = url
whisky.save

url = 'https://www.chatelaine.com/wp-content/uploads/2018/06/Classic-aperol-spritz-800x800.jpg'
spritz = Cocktail.new(name: 'Spritz')
spritz.remote_photo_url = url
spritz.save
