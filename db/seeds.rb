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
Symptom.destroy_all
Specie.destroy_all
puts "Database cleaned"

puts "Creating a user in the database..."
file = URI.open('https://avatars.githubusercontent.com/u/84763826?v=4')
user_one = User.create!(first_name: "JeanPierre", last_name: "Dupcuhe", email: "jeanpierre@gmail.com", password:"123456", is_veterinarian: false)
user_one.photo.attach(io: file, filename: 'nes.jpg', content_type: 'image/jpg')

file = URI.open('https://avatars.githubusercontent.com/u/85242561?v=4')
user_two = User.create!(first_name: "Emily", last_name:"Santos", email: "emily@gmail.com", password:"123456", is_veterinarian: true)
user_two.photo.attach(io: file, filename: 'nes.jpg', content_type: 'image/jpg')

puts "Creating species list"
specie_dog = Specie.create!(name: "Dog")
specie_cat = Specie.create!(name: "Cat")
specie_chicken = Specie.create!(name: "Chicken")

puts "Creating the animal in the database..."
file = URI.open('https://cdn.futura-sciences.com/buildsv6/images/largeoriginal/8/5/8/858743bb35_50169458_chien-min.jpg')
animal_one = Animal.create!(name: "Balto",
                age: "2",
                weight: "5",
                specie: Specie.find_by(name: "Dog"),
                user: user_one)
animal_one.photo.attach(io: file, filename: 'nes.jpg', content_type: 'image/jpg')
file = URI.open('https://www.history.com/.image/ar_4:3%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTg0NTEzNzgyNTMyNDE2OTk5/black-cat-gettyimages-901574784.jpg')
animal_two = Animal.create!(name: "Leo",
                age: "2",
                weight: "7",
                specie: Specie.find_by(name: "Cat"),
                user: user_one)
animal_two.photo.attach(io: file, filename: 'nes.jpg', content_type: 'image/jpg')
file = URI.open('https://cdn.mos.cms.futurecdn.net/BX7vjSt8KMtcBHyisvcSPK-1200-80.jpg')
animal_three = Animal.create!(name: "Daisy",
                age: "5",
                weight: "3",
                specie: Specie.find_by(name: "Chicken"),
                user: user_one)
animal_three.photo.attach(io: file, filename: 'nes.jpg', content_type: 'image/jpg')

puts "Creating the symptoms in the database..."

Symptom.create!(suggestion: "Biting",
                description: "teach your dog to wear a head halter and basket muzzle.",
                specie: specie_dog)
Symptom.create!(suggestion:" Blue Gum)in Dogs",
                description: "Just give him some vitamin C for 3 days. Its a sign of of lack of vitality ",
                specie: specie_dog)
Symptom.create!(suggestion:"Pealed skin on the nose in Dogs",
                description: "put rehyydrated greasy cream to moistorise the dry area of the pealed nose.",
                specie: specie_dog)
Symptom.create!(suggestion:"vomit in Dogs",
                description: "If  your dog has been vomiting for several times in hour, immediately call for veterinary help.",
                specie: specie_dog)
Symptom.create!(suggestion:"rapid heartbeating in Cats",
                description: "if your cat look weak , take her in a quiet and dark place to alow her to callm done ,then call the vet",
                specie: specie_cat)
Symptom.create!(suggestion:"Clumsy walk in Cats",
                description: "This is sign of low blood pressure. Hence need to get her rehydrated as soon as possible.",
                specie: specie_cat)
Symptom.create!(suggestion:"sufocating in cats",
                description: "take your cat outside and help breath fresh air. Do no overwhelm her and make sure she get some water ",
                specie: specie_cat)
Symptom.create!(suggestion:"white spot near the eyes ",
                description: "This is probably due to an allergy. This is not critical. Get the advice of a vet when possible ",
                specie: specie_cat)
Symptom.create!(suggestion:"Dizzy in Dogs",
                description: "if there is no reaction while showing your fingers in front of him, this means that the dog will soon fait.get a vet help as soon as possible",
                specie: specie_dog)
Symptom.create!(suggestion:"diarrhea in Dogs",
                description: "Get him rehydrated with some water mixed with wter and suger ",
                specie: specie_cat)
Symptom.create!(suggestion:"Blind Quiet Eye in cat",
                description: "Your veterinarian will try to localize the disease and will often refer you to a veterinary ophthalmologist.",
                specie: specie_cat)
Symptom.create!(suggestion:"Blind Quiet Eye in Dogs",
                description: "Your veterinarian will try to localize the disease and will often refer you to a veterinary ophthalmologist.",
                specie: specie_chicken)
Symptom.create!(suggestion:"white spot in Chicken ",
                description: "Isolate her in an area where there is lots of soil",
                specie: specie_chicken)
Symptom.create!(suggestion:"Faint in chicken",
                description: "Most probably the chicken suffer from a weak blood irrigation to the muscles ",
                specie: specie_chicken)
Symptom.create!(suggestion:"Fall out of feathers ",
                description: "This might be due to not enough space for the chicken to live. Need to provide her a bigger area to leave4 ",
                specie: specie_chicken)
Symptom.create!(suggestion:"Agressivity in chicken",
                description: "uncontrolled behaviour? Get your chicken in a dark place and let her clam by herself.",
                specie: specie_chicken)


puts "Finished building up database..."
