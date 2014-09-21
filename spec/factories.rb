FactoryGirl.define do
	factory :user do
		sequence(:name) { |n| "Person #{n}" }
		sequence(:email) { |n| "person_#{n}@example.com" }
		password "foobar123"
		password_confirmation "foobar123"
	end

	factory :billing do
		sequence(:name) { |n| "Billing #{n}" }
		description "Just a billing"
		value 500
		status false
		user
	end
end