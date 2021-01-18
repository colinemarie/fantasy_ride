require 'open-uri'

puts 'cleaning'
Reservation.destroy_all
User.destroy_all
Vehicle.destroy_all
Category.destroy_all

puts 'adding users...'

jafar = User.new(first_name: 'Jafar', last_name: 'Lazhar', age: 56, email: 'jafar@gmail.com', password: 'Coucou460')
file = URI.open('https://res.cloudinary.com/dw3inosxv/image/upload/v1610799838/jafar_o3mzjk.png')
jafar.avatar.attach(io: file, filename: 'jafar.png', content_type: 'image/png')
jafar.save!
puts 'jafar created'

jon = User.new(first_name: 'Jon', last_name: 'Snow', age: 34, email: 'john@gmail.com', password: 'Coucou460')
file = URI.open('https://res.cloudinary.com/dw3inosxv/image/upload/v1610799764/jon-snow_e4xx69.jpg')
jon.avatar.attach(io: file, filename: 'jon.png', content_type: 'image/png')
jon.save!
puts 'jon created'

steven = User.new(first_name: 'Steven', last_name: 'Spielberg', age: 74, email: 'steven@gmail.com', password: 'Coucou460')
file = URI.open('https://res.cloudinary.com/dw3inosxv/image/upload/v1610799785/steven_etmtju.jpg')
steven.avatar.attach(io: file, filename: 'steven.png', content_type: 'image/png')
steven.save!
puts 'steven created'

myriam = User.new(first_name: 'Mymy', last_name: 'Riam', age: 21, email: 'myriam@gmail.com', password: 'Coucou460')
file = URI.open('https://res.cloudinary.com/dw3inosxv/image/upload/v1610799831/myriam_idxvuk.jpg')
myriam.avatar.attach(io: file, filename: 'myriam.png', content_type: 'image/png')
myriam.save!
puts 'myriam created'

luc = User.new(first_name: 'Luc', last_name: 'Besson', age: 21, email: 'luc@gmail.com', password: 'Coucou460')
file = URI.open('https://res.cloudinary.com/dw3inosxv/image/upload/v1610875566/fantasy-ride/besson_madocs.jpg')
luc.avatar.attach(io: file, filename: 'luc.png', content_type: 'image/png')
luc.save!
puts 'luc created'

puts 'users done'

puts 'adding categories...'

air = Category.create(name: 'air')
sea = Category.create(name: 'sea')
wheels = Category.create(name: 'wheels')
animal = Category.create(name: 'animal')
time = Category.create(name: 'time')

puts 'adding vehicles...'


kitt = Vehicle.new(name: "K.I.T.T.", price_per_day: 2000,
                   description: "Forget about the slackbot and discover the true K.I.T.T. You can even ask David Hasselhoff to be your driver.\n\n
                   Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna
                   aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                   Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
                   occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
                   address: 'Eklecty-City', capacity: 3, minimum_age: 16)
kitt.user = jon
file = URI.open('https://res.cloudinary.com/dw3inosxv/image/upload/v1610877918/fantasy-ride/kitt1_sesxhn.jpg')
kitt.photos.attach(io: file, filename: 'kitt.png', content_type: 'image/png')
kitt.save!
kitt.categories_vehicles.create!(category: wheels)

puts 'kitt created'


carpet = Vehicle.new(name: "Aladdin's Magic Carpet", price_per_day: 1200,
                     description: "This Magic Carpet will show you a whole new world, unbelievable sights and an indescribable feeling.\n
                     Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna
                     aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                     Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
                     occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
                     address: 'Montreuil', capacity: 3, minimum_age: 16)
carpet.user = jafar
file = URI.open('https://res.cloudinary.com/dw3inosxv/image/upload/v1610483257/fantasy-ride/aladdin_carpet_r1csko.jpg')
carpet.photos.attach(io: file, filename: 'carpet.png', content_type: 'image/png')
carpet.save!
carpet.categories_vehicles.create!(category: air)

puts 'carpet created'


titanic = Vehicle.new(name: "Titanic", price_per_day: 49999,
                     description: "Perfect to transport you and your friends safely around the world ! \n
                     Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et
                      dolore magna aliqua. \n Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
                      ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
                      fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
                      mollit anim id est laborum",
                     address: 'Port de Brest', capacity: 3300, minimum_age: 25)
titanic.user = steven
file = URI.open('https://res.cloudinary.com/dw3inosxv/image/upload/v1610483441/fantasy-ride/titanic-the-unsinkable-ship_ehzbio.jpg')
titanic.photos.attach(io: file, filename: 'titanic.png', content_type: 'image/png')
titanic.save!
titanic.categories_vehicles.create!(category: sea)

puts 'titanic created'


bike = Vehicle.new(name: "Eliott's bicycle", price_per_day: 900,
                     description: "Join E.T. for a bicycle ride through the nightime sky

                     Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et
                      dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
                      ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
                      fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
                      mollit anim id est laborum",
                     address: 'California', capacity: 1, minimum_age: 12)
bike.user = steven
file = URI.open('https://res.cloudinary.com/dw3inosxv/image/upload/v1610831264/fantasy-ride/et_bike2_mhqeq7.jpg')
bike.photos.attach(io: file, filename: 'bike.png', content_type: 'image/png')
bike.save!
bike.categories_vehicles.create!(category: wheels)
bike.categories_vehicles.create!(category: air)

puts 'ET bike created'

drogon = Vehicle.new(name: "Drogon", price_per_day: 4698,
                     description: "If you are into burning entire cities to ashes, you have to try a ride on Drogon
                     Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et
                      dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
                      ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
                      fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
                      mollit anim id est laborum",
                     address: 'Westeros', capacity: 2, minimum_age: 25)
drogon.user = jon
file = URI.open('https://res.cloudinary.com/dw3inosxv/image/upload/v1610832117/fantasy-ride/dragon_iufqob.jpg')
drogon.photos.attach(io: file, filename: 'drogon.png', content_type: 'image/png')
drogon.save!
drogon.categories_vehicles.create!(category: air)
drogon.categories_vehicles.create!(category: animal)

puts 'drogon created'

slippers = Vehicle.new(name: "Dorothy's Ruby Slippers", price_per_day: 135,
                     description: "Step into magic!
                     Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et
                      dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
                      ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
                      fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
                      mollit anim id est laborum",
                     address: 'Munchkin Country', capacity: 1, minimum_age: 16)
slippers.user = jon
file = URI.open('https://res.cloudinary.com/dw3inosxv/image/upload/v1610816806/fantasy-ride/ruby-slippers_qswza2.jpg')
slippers.photos.attach(io: file, filename: 'slippers.png', content_type: 'image/png')
slippers.save!
slippers.categories_vehicles.create!(category: time)

puts 'slippers created'

dolorean = Vehicle.new(name: "Dolorean", price_per_day: 4698,
                     description: "Feeling nostalgia for days when partying was authorized? Try the Dolorean for a ride through time

                     Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et
                      dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
                      ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
                      fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
                      mollit anim id est laborum",
                     address: 'California', capacity: 3, minimum_age: 12)
dolorean.user = steven
file = URI.open('https://res.cloudinary.com/dw3inosxv/image/upload/v1610483261/fantasy-ride/delorean_dmc-12_um2xt1.jpg')
dolorean.photos.attach(io: file, filename: 'dolorean.png', content_type: 'image/png')
dolorean.save!
dolorean.categories_vehicles.create!(category: wheels)
dolorean.categories_vehicles.create!(category: air)

puts 'dolorean created'

carriage = Vehicle.new(name: "Cinderella's carriage", price_per_day: 467,
                     description: "Looking for a prince?
                     Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et
                      dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
                      ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
                      fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
                      mollit anim id est laborum",
                     address: 'Near Castle', capacity: 4, minimum_age: 16)
carriage.user = myriam
file = URI.open('https://res.cloudinary.com/dw3inosxv/image/upload/v1610817452/fantasy-ride/cendrillon_c6ubo0.jpg')
carriage.photos.attach(io: file, filename: 'carriage.png', content_type: 'image/png')
carriage.save!
carriage.categories_vehicles.create!(category: wheels)

puts 'carriage created'

umbrella = Vehicle.new(name: "Mary Poppins' umbrella", price_per_day: 467,
                     description: "This umbrella is the sure of to find the fun! (But don't forget to snap)
                     Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et
                      dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
                      ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
                      fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
                      mollit anim id est laborum",
                     address: 'London', capacity: 1, minimum_age: 16)
umbrella.user = jafar
file = URI.open('https://res.cloudinary.com/dw3inosxv/image/upload/v1610817743/fantasy-ride/mary-poppins_alrbht.jpg')
umbrella.photos.attach(io: file, filename: 'umbrella.png', content_type: 'image/png')
umbrella.save!
umbrella.categories_vehicles.create!(category: air)

puts 'umbrella created'


submarine = Vehicle.new(name: "Steeve Zissou's submarine", price_per_day: 1399,
                     description: "Want to explore the aquatic life? \n\n
                     Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et
                      dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
                      ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
                      fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
                      mollit anim id est laborum",
                     address: 'Under the sea', capacity: 1, minimum_age: 12)
submarine.user = luc
file = URI.open('https://res.cloudinary.com/dw3inosxv/image/upload/v1610832936/fantasy-ride/submarine_mdvana.jpg')
submarine.photos.attach(io: file, filename: 'submarine.png', content_type: 'image/png')
submarine.save!
submarine.categories_vehicles.create!(category: sea)

puts 'submarine created'

taxi = Vehicle.new(name: "Leeloo's Taxi", price_per_day: 235,
                     description: "If you want to find the 5th Element, may be a ride with this taxi could help...
                     Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et
                      dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
                      ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
                      fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
                      mollit anim id est laborum",
                     address: 'Somewhere', capacity: 4, minimum_age: 18)
taxi.user = luc
file = URI.open('https://res.cloudinary.com/dw3inosxv/image/upload/v1610833241/fantasy-ride/taxi_fifth_element_bmdocy.jpg')
taxi.photos.attach(io: file, filename: 'taxi.png', content_type: 'image/png')
taxi.save!
taxi.categories_vehicles.create!(category: air)

puts 'taxi created'

nimbus = Vehicle.new(name: "Harry Potter Nimbus 2000", price_per_day: 467,
                     description: "The Nimbus 2000 is the perfect broomstick, good speed and exceptional handling. Be careful, not for beginners !
                     Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et
                      dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
                      ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
                      fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
                      mollit anim id est laborum",
                     address: 'Poudlard', capacity: 2, minimum_age: 16)
nimbus.user = steven
file = URI.open('https://res.cloudinary.com/dw3inosxv/image/upload/v1610833147/fantasy-ride/nimbus_j95sel.jpg')
nimbus.photos.attach(io: file, filename: 'nimbus.png', content_type: 'image/png')
nimbus.save!
nimbus.categories_vehicles.create!(category: air)

puts 'nimbus created'


puts 'vehicles done'


puts 'adding reservations...'

start_date = Date.new(2021, 2, 15)
end_date = start_date + 2
reservation1 = Reservation.new(start_date: start_date, end_date: end_date)
reservation1.vehicle = carpet
reservation1.total_price = (reservation1.vehicle.price_per_day ) * 2
reservation1.user = myriam
reservation1.save!

puts 'one reservation done'

start_date = Date.new(2021, 1, 18)
end_date = start_date + 6
reservation2 = Reservation.new(start_date: start_date, end_date: end_date)
reservation2.vehicle = drogon
reservation2.total_price = (reservation2.vehicle.price_per_day ) * 6
reservation2.user = steven
reservation2.save!

puts 'two reservations done'


puts "that's it!"


