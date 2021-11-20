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
user_one = User.create!(first_name: "Jeanpierre", last_name: "Dupcuhe", email: "jeanpierre@gmail.com", password:"123456", is_veterinarian: true)
user_two = User.create!(first_name: "Nico", last_name:"Bagnath", email: "nico@gmail.com", password:"123456", is_veterinarian: false)

puts "Creating species list"
specie_dog = Specie.create!(name: "Dog")
Specie.create!(name: "Cat")
Specie.create!(name: "Chicken")

puts "Creating the animal in the database..."

Animal.create!( name: "Balto",
                age: "2",
                weight: "5",
                specie: Specie.find_by(name: "Dog"),
                user: user_one)
#               photo: "Balto",
puts "Creating the symptoms in the database..."
Symptom.create!(suggestion: "Biting",
                description: "You are probably not going to “cure” this aggressive dog, however, controlling the behavior is the goal. If the number of aggressive incidents can be decreased, you should feel that you have succeeded. A dog-training specialist can help you develop safety and management tools.
Safety should be the primary concern. Avoid situations that may bring on an aggressive reaction. If your behaviorist recommends punishment/dominance-based training techniques, you may want to seek alternative help, as it may escalate aggression. There are better ways to deal with the problem.
Feed the dog in a confined space and do not give it items that might incite aggressive behavior. Confine it to areas where people can neither be heard nor seen. Finally, teach your dog to wear a head halter and basket muzzle.
In extreme cases, it may be necessary to put the dog down (euthanize), as it is sometimes the only way to assuredly prevent your dog from injuring others -- especially those that have already been involved in an incident or incidents.",
                specie: Specie.find_by(name: "Dog"))
Symptom.create!(suggestion:"Periodontal (Gum) Disease in Dogs",
                description: "If all teeth are in Stage 1, no further treatment will be necessary, but you need to brush your dog’s teeth daily.",
                specie: Specie.find_by(name: "Dog"))
Symptom.create!(suggestion:"Skin Disease, Autoimmune (Pemphigus) in Dogs",
                description: "Your dog will need to be hospitalized for supportive care if it is severely affected by the condition. Steroid therapy may be prescribed briefly to bring the condition under control. If corticosteroid and azathioprine therapy is prescribed, your dog will be switched to a low-fat diet, since these medications can dispose animals to pancreatitis. Your veterinarian will treat your dog with the drugs that are specifically suited to the form of pemphigus it has.",
                specie: Specie.find_by(name: "Dog"))
Symptom.create!(suggestion:"Carbon Monoxide Toxicosis in Dogs",
                description: "If you suspect that your dog has been subjected to excessive amounts of carbon monoxide, immediately call for veterinary help. In the meantime, remove your dog from the source of the toxic gas to a location where it can breathe fresh air. Your veterinarian will start emergency treatment to restore adequate levels of oxygen to the vital organs. Supplementation of 100 percent pure oxygen is the best method for initiating a quick recovery. Fluids will also be given to improve blood perfusion to vital organs like the brain, as well as to normalize the increased concentrations of acids in blood.",
                specie: Specie.find_by(name: "Dog"))
Symptom.create!(suggestion:"Heart Murmurs in Cats",
                description: "Unless heart failure is evident, your cat will be treated as an outpatient. The course of treatment will be determined based on the associated clinical signs. Kittens with low grade murmurs, for example, may require little or no treatment and the murmur may resolve itself within six months. Routine diagnostic imaging is recommended for cats with murmurs",
                specie: Specie.find_by(name: "Cat"))
Symptom.create!(suggestion:"Thunderstorm Phobias in Cats",
                description: "It is important to avoid crate confinement, if you believe there is a risk of the cat injuring itself. Otherwise, there are forms of behavior modification or medication (e.g., antidepressants, anti-anxiety drugs) that you can request from your veterinarian.",
                specie: Specie.find_by(name: "Cat"))
Symptom.create!(suggestion:"Brachial Plexus Avulsion in Cats",
                description: "Treatment will be based on the severity of the injury. Bandaging the foreleg and protecting it from further injury is the most common response. Anti-inflammatory drugs are commonly given to decrease swelling, and pain relievers will be prescribed if your cat appears to be suffering. Amputation is sometimes required for injuries that cannot be repaired, or under circumstances where the injury is life threatening.",
                specie: Specie.find_by(name: "Cat"))
Symptom.create!(suggestion:"Tetanus Bacillus Infection in Cats",
                description: "In advanced stages of this disease, your cat will need to be hospitalized. Good support and constant nursing is usually required for a period of 3-4 weeks. If your cat is not able to eat on its own, your veterinarian will place a feeding tube directly into its stomach in order to maintain its energy and metabolic needs. Because this toxin attacks the muscles and nervous system, these animals are very sensitive, making forced feedings an undesirable treatment method. Such manipulations may, in fact, exacerbate the symptoms. Intravenous fluids may be started to prevent dehydration. That will be one of the primary concerns.

One of the important aspects of nursing care is to keep the cat in an environment of low light and low noise, as these animals are extremely sensitive to touch, sound, and light.

Your cat will be kept sedated to prevent further aggravation of the symptoms. Drugs can be used to minimize the muscle spasm and convulsions. In combination, these types of drugs will encourage your cat to remain in a lying position for extended periods. Because of this, there is a concern for the side effects of lying in one place for too long. You should provide your cat with soft bedding, and you will need to schedule regular times throughout the day when you can turn your cat over to its other side, to prevent bed sores/ulcers from developing.

In the event that your cat is not able to breathe properly, a tube will be placed into the trachea to facilitate normal breathing until the muscles have recovered from the infection. In some animals, a hole has to be made into the trachea to facilitate breathing and prevent asphyxia. If your cat is not able to pass urine, a urinary catheter will be placed to allow for the passage of urine. If your cat is constipated, an enema can be given to relieve constipation. These treatments may be applied in the home environment, in many cases. The most important consideration is the ability to maintain a sterile environment for the cat, if it is going to be receiving home treatment after the initial in-clinic care. You will need to discuss this with your veterinarian and go over the proper procedures for avoiding contamination.

Drugs will be given to bind the toxin and prevent its further binding to the nerve cells. Antibiotics will also also given, either orally or by injection, to control further spread of the infection. Topical (outer) antibiotics will also be used around the periphery of the wound to control infection.",
                specie: Specie.find_by(name: "Cat"))
Symptom.create!(suggestion:"Pectus Excavatum in Dogs",
                description: "Surgery remains the only treatment option for repairing this deformity. However, if the disease is mild and your dog only has a flat chest, then it may be improved without surgery. In such cases, your veterinarian will instruct you in manually compressing the chest in such a way that will encourage the sternum and costal cartilages to take on a more convex shape.

In some dogs, a splint application will work to reduce the mild defects. However, in cases of moderate or severe inward sinking of the sternum, surgery is indicated for correction of the defects. The technique used by your veterinary surgeon will depend on your dog's age and the extent of the problem. Dogs with respiratory problems that are directly related to this condition, meanwhile, generally improve substantially after surgery and will start breathing more comfortably.",
                specie: Specie.find_by(name: "Dog"))
 Symptom.create!(suggestion:"Urine Crystals in Dogs",
                description: "Treatment will involve managing clinically important crystalluria by eliminating or controlling the underlying cause(s) or associated risk factors.

Treatment will also work to minimize clinically important crystalluria by increasing urine volume, encouraging complete and frequent voiding, modifying the diet, and in some instances, by appropriate drug therapy.",
                specie: Specie.find_by(name: "Dog"))
 Symptom.create!(suggestion:"Blind Quiet Eye in Dogs",
                description: "Your veterinarian will try to localize the disease and will often refer you to a veterinary ophthalmologist. Unfortunately, there is no effective treatment for Blind Quiet Eye brought on by SARDS, progressive retinal atrophy, optic nerve atrophy, or optic nerve hypoplasia. However, cataracts, luxated lenses, and some forms of retinal detachment may be treated surgically.

In addition, dogs with retinal detachment should have their exercise severely restricted until the retina is firmly reattached. These patients should also be switched to a calorie-restricted diet to prevent obesity, which could occur due to reduced activity.",
                specie: Specie.find_by(name: "Dog"))

puts "Finished building up database..."
