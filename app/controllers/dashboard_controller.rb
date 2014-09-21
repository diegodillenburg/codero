class DashboardController < ApplicationController
	def index
		@billings = current_user.billings
	end
end
