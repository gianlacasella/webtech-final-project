
namespace :db do

  task :query_1 => :environment do
  # Sample query: Get the names of the events available and print them out.
  # Always print out a title for your query
  puts "Get all stays created by user id=2"
  puts "--Start of Query--"

  id = 2
  puts Lodge.where(user_id: id).to_yaml
  puts "--End Of Query--"
  puts ""
  end

  task :query_2 => :environment do
    # Sample query: Get the names of the events available and print them out.
    # Always print out a title for your query
    #
    puts "Get all users that stayed in location id=5"
    puts "--Start of Query--"

    lodge_id = 5
    #puts Inbox.find(1).to_yaml
    aux = PreReservation.where(lodge_id: lodge_id)
    aux.each do |p|
      inb = Inbox.where(pre_reservation_id:p.id)
      us = User.where(id:inb[0].user_id)
      puts us
    end
    #puts PreReservation.where(confirmed: true).inboxes.to_yaml
    puts "--End Of Query--"
    puts ""
  end

  task :query_3 => :environment do
    puts "Get all reservations related to location id=5"
    puts "--Start of Query--"
    lodge_id = 5
    pr = PreReservation.where(confirmed: true, lodge_id: lodge_id)
    pr.each do |p|
      t = Inbox.where(pre_reservation_id: p.id).limit(1)
      user = User.where(id: t[0].user_id)
      puts "start_date:%s , end_date:%s , %s" % [p.start_date.to_s,p.end_date.to_s,user[0].first_name+" "+user[0].last_name]

    end
    puts "--End Of Query--"
    puts ""
  end

  task :query_4 => :environment do
    puts "Get all reviews of host id=5"
    puts "--Start of Query--"
    host_id = 4
    aux = Lodge.where(user_id: host_id).ids
    aux.each do |p|
      l_r =  LodgeReview.where(lodge_id: p)
      l_r.each do |lr|
        puts "text:%s, rating:%0.1f" % [lr.description,(lr.arrival_experience + lr.price_score+
          lr.communication_score + lr.cleaning_score + lr.location_score + lr.host_reliability)/6]

      end
    end
    puts "--End Of Query--"
    puts ""
  end

  task :query_5 => :environment do
    puts "Get all reviews of guest id=2"
    puts "--Start of Query--"
    guest_id = 2
    aux = GuestReview.where(user_id:guest_id)
    aux.each do |p|
      puts "text:%s, rating:%0.1f" % [p.description,(p.score).round(1)]

    end
    puts "--End Of Query--"
    puts ""
  end

  task :query_6 => :environment do
    puts "Get the average rating of a location id = 1"
    puts "--Start of Query--"

    lodge_id = 1
    lr = Lodge.find(lodge_id)
    puts "rating:%0.1f" % [(lr.arrival_experience_score + lr.price_score+ lr.host_comunication_score +
      lr.cleaning_score + lr.location_score + lr.host_reliability_score)/6]
    puts "--End Of Query--"
    puts ""
  end

  task :query_7 => :environment do
    puts "Get all messages in a user’s inbox.id = 3"
    puts "--Start of Query--"
    user_id = 3
    msg = Inbox.where(user_id: user_id)
    puts msg.map {|p| p.text_user}

    puts "--End Of Query--"
    puts ""
  end

  task :query_8 => :environment do
    puts "Get all messages sent by user’s inbox.id = 1"
    puts "--Start of Query--"

    lodge_id = 1
    msg = Inbox.where(pre_reservation_id: lodge_id)
    puts msg.map {|p| p.text_host}
    puts "--End Of Query--"
    puts ""

  end

  task :query_9 => :environment do
    puts "--Start of Query--"
    puts "Get all users with administrative privileges in the system."
    puts User.where(is_admin: true)
    puts "--End Of Query--"
    puts ""
  end

  task :query_10 => :environment do
    2.times do
      first_name = Faker::Name.first_name
      last_name = Faker::Name.last_name
      guest_score = rand(1..5)
      host_score = rand(1..5)
      last_access = Faker::Date.in_date_period
      profile_picture = 'null'
      biography = Faker::Lorem.paragraph
      birthday = Faker::Date.birthday(min_age: 18, max_age:99)
      is_admin = Faker::Boolean.boolean(true_ratio: 0.5)
      email = "test@test.cl"
      password = Faker::Lorem.word
      phone_number = Faker::PhoneNumber.cell_phone_in_e164
      User.create!(first_name:first_name,last_name:last_name,guest_score:guest_score,host_score:host_score,
                       last_access:last_access, profile_picture:profile_picture,birthday:birthday,biography:biography,
                       is_admin:is_admin, city_id:1, password:password,email:email,registration_date:last_access,
                       phone_number:phone_number, is_host: Faker::Boolean.boolean(true_ratio: 0.5))
      end
    end
  task :query_11 => :environment do
    2.times do
      first_name = Faker::Name.first_name
      last_name = Faker::Name.last_name
      guest_score = rand(1..5)
      host_score = rand(1..5)
      last_access = Faker::Date.in_date_period
      profile_picture = 'null'
      biography = Faker::Lorem.paragraph
      birthday = Faker::Date.birthday(min_age: 18, max_age:99)
      is_admin = Faker::Boolean.boolean(true_ratio: 0.5)
      email = "test_test.cl"
      password = Faker::Lorem.word
      phone_number = Faker::PhoneNumber.cell_phone_in_e164
      User.create!(first_name:first_name,last_name:last_name,guest_score:guest_score,host_score:host_score,
                   last_access:last_access, profile_picture:profile_picture,birthday:birthday,biography:biography,
                   is_admin:is_admin, city_id:1, password:password,email:email,registration_date:last_access,
                   phone_number:phone_number, is_host: Faker::Boolean.boolean(true_ratio: 0.5))
    end
  end
  task :call => :environment do
    Rake::Task["db:query_1"].invoke
    Rake::Task["db:query_2"].invoke
    Rake::Task["db:query_3"].invoke
    Rake::Task["db:query_4"].invoke
    Rake::Task["db:query_5"].invoke
    Rake::Task["db:query_6"].invoke
    Rake::Task["db:query_7"].invoke
    Rake::Task["db:query_8"].invoke
    Rake::Task["db:query_9"].invoke
    Rake::Task["db:query_10"].invoke
    Rake::Task["db:query_11"].invoke



  end
end






