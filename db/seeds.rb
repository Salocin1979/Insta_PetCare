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

puts "Creating the animal in the database..."
Animal.create!  name: "Balto",
                age: "2",
                weight: "5",
                specie: Specie.find_by(name: "Dog"),
                user: user_one
                photo: "Balto",
puts "Creating the symptoms in the database..."
Symptom.create! description:"Biting"
                suggestion: "You are probably not going to “cure” this aggressive dog, however, controlling the behavior is the goal. If the number of aggressive incidents can be decreased, you should feel that you have succeeded. A dog-training specialist can help you develop safety and management tools.

Safety should be the primary concern. Avoid situations that may bring on an aggressive reaction. If your behaviorist recommends punishment/dominance-based training techniques, you may want to seek alternative help, as it may escalate aggression. There are better ways to deal with the problem.

Feed the dog in a confined space and do not give it items that might incite aggressive behavior. Confine it to areas where people can neither be heard nor seen. Finally, teach your dog to wear a head halter and basket muzzle.
In extreme cases, it may be necessary to put the dog down (euthanize), as it is sometimes the only way to assuredly prevent your dog from injuring others -- especially those that have already been involved in an incident or incidents."
                specie_id:"1"
puts "Finished building up database..."
