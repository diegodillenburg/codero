require 'spec_helper'

describe User do 
	before { @user = FactoryGirl.create(:user) }

	subject { @user }

	it { should respond_to(:name) }
	it { should respond_to(:email) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }

	it { should have_many(:billings) }
	it { should have_many(:debts) }

	it { should be_valid }

	
	it { should validate_presence_of(:name) }
	it { should ensure_length_of(:name).is_at_most(32) }

	it { should validate_presence_of(:email) }
	it { should validate_uniqueness_of(:email) }

	describe "when email format is invalid" do
		it "should be invalid" do
			addresses = %w[user@foo,com user_at_foo.org example.user@foo.
           foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
      	@user.email = invalid_address
      	expect(@user).not_to be_valid
      end
		end
	end

	it { should validate_presence_of(:password) }
	it { should ensure_length_of(:password).is_at_least(8) }
	# it { should validate_presence_of(:password_confirmation) }
	describe "when password_confirmation is not present" do
		before { @user.password_confirmation = "" }
		it { should_not be_valid }
	end

	describe "when password doesn't match confirmation" do
		before { @user.password_confirmation = "abcdefghijkl123" }
		it { should_not be_valid }
	end
end