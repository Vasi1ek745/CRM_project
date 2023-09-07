# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#



	20.times do
		
		Client.create(
			name: [Faker::Movies::HarryPotter.character,Faker::Movies::LordOfTheRings.character].sample,
			
			phone_number: FFaker::PhoneNumberRU.mobile_phone_number,
			email: FFaker::Internet.email,
			comments: [FFaker::Food.fruit, FFaker::Food.meat, FFaker::FoodPL.diary, FFaker::Food.vegetable].sample,
			user_id:3
			)
		5.times do 
			Client.last.jobs.create(
				name: Faker::Company.catch_phrase,
				date: Faker::Date.between(from: '2023-01-01', to: '2024-01-01') ,
				start_time:Time.at(3600*rand(6..23)+60*[15,30,45].sample) ,
				cost: rand(1500),
				place: Faker::Movies::HarryPotter.location,
				duration: rand(5),
				user_id:3
				) 
		end
	end

	