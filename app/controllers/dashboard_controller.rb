class DashboardController < ApplicationController
	def index
		@billings = current_user.billings.all(limit: 5)
	end
end
