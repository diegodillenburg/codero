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
	end

	factory :debt do
		debtor_id 2
		value 250
		status false
	end
end