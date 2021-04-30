# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
require 'faker'

# Languages
n_language = 10
n_type = 3
n_country = 10
n_city = 50
n_user = 100
n_lodge = 100
n_guest_review = 25
n_complains = 10
n_lodge_review = 30
n_reservation = 75
n_inbox = 75



# Type
n_type.times do
  name = Faker::Lorem.word
  Type.create!(name:name)
end

#Country
n_country.times do
  name = Faker::Nation.nationality
  Country.create!(name:name)
end

#City
n_city.times do
  name = Faker::Nation.capital_city
  id = rand(1..n_country)
  co = Country.find(id)
  c = City.create!(name:name, country_id:id)
end

#Users
n_user.times do

  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  guest_score = rand(1..5)
  host_score = rand(1..5)
  last_access = Faker::Date.in_date_period
  profile_picture = 'null'
  biography = Faker::Lorem.paragraph
  birthday = Faker::Date.birthday(min_age: 18, max_age:99)
  is_admin = Faker::Boolean.boolean(true_ratio: 0.5)
  email = Faker::Internet.unique.email
  password = Faker::Lorem.word
  phone_number = Faker::PhoneNumber.cell_phone_in_e164
  a = User.create!(first_name:first_name,last_name:last_name,guest_score:guest_score,host_score:host_score,
               last_access:last_access, profile_picture:profile_picture,birthday:birthday,biography:biography,
               is_admin:is_admin, city_id:rand(1..n_city), password:password,email:email,registration_date:last_access,
               phone_number:phone_number, is_host: Faker::Boolean.boolean(true_ratio: 0.5))

  n_language.times do
    a.languages << Language.create(name: Faker::Nation.language, encoding: "UTF-8")
  end

end

#GuestReview
n_guest_review.times do
  title = Faker::Lorem.sentence
  description = Faker::Lorem.paragraph
  score = Faker::Number.between(from: 0.0, to: 5.0)
  date =Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
  us = rand(1..n_user/2)
  hs =rand(n_user/2..n_user)
  GuestReview.create!(title:title, description:description, score:score, date:date, user_id:us,host_id:hs)

end

#Complains
n_complains.times do
  title = Faker::Lorem.sentence
  description = Faker::Lorem.paragraph
  date =Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
  us = rand(1..n_user/2)
  hs =rand(n_user/2..n_user)
  Complaint.create!(title:title, description:description, date:date, user_id:us,target_id:hs)
end

#Lodges
n_lodge.times do
  price = Faker::Number.number(digits: 7)
  address = Faker::Lorem.sentence
  num_beds = Faker::Number.number(digits: 1)
  num_bathrooms = Faker::Number.number(digits: 1)
  num_rooms = Faker::Number.number(digits: 1)
  gym = Faker::Boolean.boolean(true_ratio: 0.4)
  pool = Faker::Boolean.boolean(true_ratio: 0.2)
  jacuzzi = Faker::Boolean.boolean(true_ratio: 0.1)
  title = Faker::Lorem.sentence
  extra_conditions = Faker::Lorem.sentence
  description = Faker::Lorem.paragraph
  kitchen = Faker::Boolean.boolean(true_ratio: 0.8)
  air_conditioner = Faker::Boolean.boolean(true_ratio: 0.5)
  warm_water = Faker::Boolean.boolean(true_ratio: 0.9)
  shampoo = Faker::Boolean.boolean(true_ratio: 0.9)
  parking_slots = Faker::Number.number(digits: 1)
  clothespins = Faker::Boolean.boolean(true_ratio: 0.9)
  heating = Faker::Boolean.boolean(true_ratio: 0.8)
  bedsheets = Faker::Boolean.boolean(true_ratio: 0.9)
  work_zones = Faker::Boolean.boolean(true_ratio: 0.9)
  wifi = Faker::Boolean.boolean(true_ratio: 0.9)
  tvs = Faker::Number.number(digits: 1)
  longitud = Faker::Number.between(from: -180.0, to: 180.0)
  latitud = Faker::Number.between(from: -85.0, to: 85.0)
  first_aid_kit = Faker::Boolean.boolean(true_ratio: 0.9)
  smoke_detector = Faker::Boolean.boolean(true_ratio: 0.9)
  smoke_allowed = Faker::Boolean.boolean(true_ratio: 0.2)
  parties_allowed = Faker::Boolean.boolean(true_ratio: 0.3)
  pets_allowed = Faker::Boolean.boolean(true_ratio: 0.7)
  kids_allowed = Faker::Boolean.boolean(true_ratio: 0.9)
  max_people_allowed = Faker::Number.between(from: 0, to: 10)
  refrigerator = Faker::Boolean.boolean(true_ratio: 0.9)
  microwave = Faker::Boolean.boolean(true_ratio: 0.7)
  arrival_experience_score = Faker::Number.between(from: 0.0, to: 5.0)
  host_reliability_score = Faker::Number.between(from: 0.0, to: 5.0)
  location_score = Faker::Number.between(from: 0.0, to: 5.0)
  cleaning_score = Faker::Number.between(from: 0.0, to: 5.0)
  price_score = Faker::Number.between(from: 0.0, to: 5.0)
  host_communication_score = Faker::Number.between(from: 0.0, to: 5.0)
  checkin_time = Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
  checkout_time = Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
  Lodge.create!(name:title,address:address,number_of_beds:num_beds,price:price,
               number_of_bathrooms:num_bathrooms,number_of_rooms:num_rooms,
               gym:gym,pool:pool,jacuzzi:jacuzzi,conditions:extra_conditions,
               kitchen:kitchen,air_conditioner:air_conditioner,
               warm_water:warm_water,shampoo:shampoo,parking_slots:parking_slots,
               bed_sheet:bedsheets,clothespin:clothespins,heating:heating,
               video_directory:'null',photo_directory:'null',
               work_zone:work_zones,wifi:wifi,tv:tvs,smoke_detector:smoke_detector,
               first_aid_kit:first_aid_kit,refrigerator:refrigerator,
               microwave:microwave,check_in:checkin_time,check_out:checkout_time,
               smoking_allowed:smoke_allowed,parties_allowed:parties_allowed,
               pets_allowed:pets_allowed,kids_allowed:kids_allowed,people_allowed:max_people_allowed,
               arrival_experience_score:arrival_experience_score,
               host_reliability_score:host_reliability_score,
               location_score:location_score,cleaning_score:cleaning_score,
               price_score:price_score,host_comunication_score:host_communication_score,
                user_id: rand(1..n_user), description:description, type_id:rand(1..n_type) ,
  y_cord:longitud , x_cord:latitud, city_id: rand(1..n_city))

end

#Lodge_review
n_lodge_review.times do
  title = Faker::Lorem.sentence
  description = Faker::Lorem.paragraph
  score = Faker::Number.between(from: 0.0, to: 5.0)
  date =Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
  us = rand(1..n_user)
  hs =rand(1..n_lodge)
  arrival_experience_score = Faker::Number.between(from: 0.0, to: 5.0)
  host_reliability_score = Faker::Number.between(from: 0.0, to: 5.0)
  location_score = Faker::Number.between(from: 0.0, to: 5.0)
  cleaning_score = Faker::Number.between(from: 0.0, to: 5.0)
  price_score = Faker::Number.between(from: 0.0, to: 5.0)
  host_communication_score = Faker::Number.between(from: 0.0, to: 5.0)
  LodgeReview.create!(title:title, description:description, arrival_experience:arrival_experience_score,
                      date:date, price_score:price_score, communication_score:host_communication_score,
                      cleaning_score:cleaning_score, location_score:location_score,
                      host_reliability:host_reliability_score,
                      user_id:us,lodge_id:hs)
end

#Prereservation
n_reservation.times do
  end_date = Faker::Time.between(from: DateTime.now , to: DateTime.now+1)
  start_date = Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
  pre_reservation_date_time = Faker::Time.between(from: DateTime.now - 10, to: DateTime.now-1)
  number_of_people = rand(1..10)
  lodge = rand(1..n_lodge)
  PreReservation.create!(start_date:start_date,end_date:end_date,pre_reservation_date_time:pre_reservation_date_time,
  number_of_people:number_of_people,lodge_id:lodge, confirmed: Faker::Boolean.boolean(true_ratio: 0.7))
end

#Inbox

n_inbox.times do
  text_user = Faker::Lorem.paragraph
  text_host =Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
  i = Inbox.create!(text_user:text_user, text_host:text_host, user_id: rand(1..n_user), pre_reservation_id: rand(1..n_reservation))



end










