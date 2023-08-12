# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
	def time_rand(from = 0.0, to = Time.now)
		Time.at(from + rand * (to.to_f - from.to_f))
	end

	20.times do
		name_surnme = [Faker::JapaneseMedia::Naruto.character, Faker::Movies::HarryPotter.character,Faker::Movies::LordOfTheRings.character].sample
		name = name_surnme.split[0]
		surname = name_surnme.split[1] || FFaker::NameRU.last_name
		date_time = time_rand(1691183241, 1698783241)



		Client.create(
			name: name,
			surname: surname,
			phone_number: FFaker::PhoneNumberRU.mobile_phone_number,
			email: FFaker::Internet.email,
			comments: [FFaker::Food.fruit, FFaker::Food.meat, FFaker::FoodPL.diary, FFaker::Food.vegetable].sample
			)
		rand(5).times do 
			Client.last.jobs.create(
				name: Faker::Company.catch_phrase,
				date_time: date_time,
				cost: rand(100)
				) 
		end
	end

	