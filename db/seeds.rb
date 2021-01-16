require 'open-uri'

puts 'cleaning'
Reservation.destroy_all
User.destroy_all
Vehicle.destroy_all

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

puts 'users done'

puts 'adding categories...'

air = Category.create(name: 'air')
sea = Category.create(name: 'sea')
wheels = Category.create(name: 'wheels')
animal = Category.create(name: 'animal')
time = Category.create(name: 'time')

puts 'adding vehicles...'

carpet = Vehicle.new(name: "Aladdin's Magic Carpet", price_per_day: 1200,
                     description: "This Magic Carpet will show you a whole new world, unbelievable sights and an indescribable feeling.

                     Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna
                     aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                     Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
                     occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
                     address: 'Dans la Lampe', capacity: 3, minimum_age: 16)
carpet.user = jafar
file = URI.open('https://res.cloudinary.com/dw3inosxv/image/upload/v1610483257/fantasy-ride/aladdin_carpet_r1csko.jpg')
carpet.photos.attach(io: file, filename: 'carpet.png', content_type: 'image/png')
carpet.save!
carpet.categories_vehicles.create!(category: air)

puts 'carpet created'


titanic = Vehicle.new(name: "Titanic", price_per_day: 49999,
                     description: "Perfect to transport you and your friends safely around the world

                     Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et
                      dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
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


bike = Vehicle.new(name: "Eliott's'bicycle", price_per_day: 900,
                     description: "Join E.T. for a bicycle ride through the nightime sky

                     Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et
                      dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
                      ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
                      fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
                      mollit anim id est laborum",
                     address: 'California', capacity: 1, minimum_age: 12)
bike.user = steven
file = URI.open('https://res.cloudinary.com/dw3inosxv/image/upload/v1610483265/fantasy-ride/et_bike_ihcu61.jpg')
bike.photos.attach(io: file, filename: 'bike.png', content_type: 'image/png')
bike.save!
bike.categories_vehicles.create!(category: wheels)
bike.categories_vehicles.create!(category: air)

puts 'ET bike created'


dolorean = Vehicle.new(name: "Dolorean", price_per_day: 4698,
                     description: "Feeling nostalgia for days when partying was authorized? Try the Dolorean for a ride through time

                     Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et
                      dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
                      ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
                      fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
                      mollit anim id est laborum",
                     address: 'California', capacity: 1, minimum_age: 12)
dolorean.user = steven
file = URI.open('https://res.cloudinary.com/dw3inosxv/image/upload/v1610483261/fantasy-ride/delorean_dmc-12_um2xt1.jpg')
dolorean.photos.attach(io: file, filename: 'dolorean.png', content_type: 'image/png')
dolorean.save!
dolorean.categories_vehicles.create!(category: wheels)
dolorean.categories_vehicles.create!(category: air)

puts 'dolorean created'


drogon = Vehicle.new(name: "Drogon", price_per_day: 4698,
                     description: "If you are into burning entire cities to ashes, you have to try a ride on Drogon
                     Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et
                      dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
                      ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
                      fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
                      mollit anim id est laborum",
                     address: 'Parallel world', capacity: 2, minimum_age: 25)
drogon.user = jon
file = URI.open('https://res.cloudinary.com/dw3inosxv/image/upload/v1610485781/fantasy-ride/dragon-got_ktaiuy.jpg')
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
file = URI.open('https://res.cloudinary.com/dw3inosxv/image/upload/v1610485781/fantasy-ride/dragon-got_ktaiuy.jpg')
slippers.photos.attach(io: file, filename: 'slippers.png', content_type: 'image/png')
slippers.save!
slippers.categories_vehicles.create!(category: time)

puts 'slippers created'


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


