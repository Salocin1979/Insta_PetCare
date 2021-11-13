# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# puts "Cleaning up database..."
Animal.destroy_all
User.destroy_all
puts "Database cleaned"

puts "Creating a user in the database..."
user_one = User.create!(first_name: "Jeanpierre", last_name: "Dupcuhe", email: "jeanpierre@gmail.com", password:"123456", is_veterinarian: true)
user_two = User.create!(first_name: "Nico", last_name:"Bagnath", email: "nico@gmail.com", password:"123456", is_veterinarian: false)

puts "Creating species list"
Specie.create! name: "Dog"
Specie.create! name: "Cat"
Specie.create! name: "Chicken"

puts "Creating the outfit in the database..."
Animal.create!  name: "Balto",
                age: "2",
                weight: "5",
                specie: Specie.find_by(name: "Dog"),
                user: user_one
                photo: "Balto"
puts "Finished building up database..."