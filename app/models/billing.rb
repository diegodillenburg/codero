class Billing < ActiveRecord::Base
	belongs_to :creditor, class_name: "User"
	has_many :debts, dependent: :destroy
	
end
