# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "cleaning database"
Pokemon.destroy_all
User.destroy_all


puts "Creating ..."
user1 = User.create!(email: "mint@mint.com", password: "123456")
Pokemon.create!(name: "Bulbasaur", type_pokemon: "Grass", description: "grass dinosaur", level: 1, user: user1)
# Charmeloen = Pokemon.create(name: "Charmeloen", type: "Fire/Dragon", description: "fire flying", level: 2)
# Warturtle = Pokemon.create(name: "Warturtle", type: "Water", description: "water type", level: 3)
# Butterfree = Pokemon.create(name: "Butterfree", type: "Bug", description: "flying bug", level: 1)
puts "Finished!"




