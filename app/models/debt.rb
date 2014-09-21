class Debt < ActiveRecord::Base
	belongs_to :billing
	has_one :user, foreign_key: "debtor_id"
	
end
