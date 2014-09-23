class DebtsController < ApplicationController
	include ApplicationHelper
	
	def index
		@debts = current_user.debts
	end
end