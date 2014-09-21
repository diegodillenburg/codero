require 'spec_helper'

	describe "creating billings" do
		let(:user) { FactoryGirl.create(:user) }
		login_as(:user)
	end