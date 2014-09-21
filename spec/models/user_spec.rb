require 'spec_helper'

describe User do 
	before { @user = FactoryGirl.create(:user) }

	subject { @user }

	it { should respond_to(:name) }
	it { should respond_to(:email) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it { should respond_to(:billings) }

	it { should be_valid }

	describe "when name is not present" do
		before { @user.name = "" }
		it { should_not be_valid }
	end

	describe "when name is too long" do
		before { @user.name = "a" * 33 }
		it { should_not be_valid }
	end

	describe "when email is not present" do
		before { @user.email = "" }
		it { should_not be_valid }
	end

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

	describe "when email address is already taken" do
		before do
			@user = FactoryGirl.build(:user)
			user_with_same_email = @user.dup
			user_with_same_email.save
		end

		it { should_not be_valid }
	end

	describe "when password is not present" do
		before { @user.password = "" }
		it { should_not be_valid }
	end

	describe "when password_confirmation is not present" do
		before { @user.password_confirmation = "" }
		it { should_not be_valid }
	end

	describe "when password doesn't match confirmation" do
		before { @user.password_confirmation = "abcdefghijkl123" }
		it { should_not be_valid }
	end

	describe "when password is too short" do
		before { @user.password = @user.password_confirmation = "a" * 5 }
		it { should_not be_valid }
	end
end