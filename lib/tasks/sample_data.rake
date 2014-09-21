namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		make_users
	end
end

def make_users
	User.create!(name: "Admin User",
							 email: "admin@codero.com",
							 password: "foobar123",
							 password_confirmation: "foobar123")
	9.times do |n|
		name = Faker::Name.name
		email = Faker::Internet.email
		password = "password123"
		User.create!(name: name,
								 email: email,
								 password: password,
								 password_confirmation: password)
	end
end

def create_billings
	users = User.all
	users.each do |user|
		5.times do
			user.billing.create!(FactoryGirl.create(:billing))
		end
	end
end