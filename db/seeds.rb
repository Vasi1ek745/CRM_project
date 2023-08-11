# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


	20.times do
		Client.create(
			name: FFaker::NameRU.first_name,
			surname: FFaker::NameRU.last_name,
			phone_number: FFaker::PhoneNumberRU.mobile_phone_number,
			email: FFaker::Internet.email,
			comments: [FFaker::Food.fruit, FFaker::Food.meat, FFaker::FoodPL.diary, FFaker::Food.vegetable].sample
			)
	end