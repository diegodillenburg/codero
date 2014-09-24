class Debt < ActiveRecord::Base
	belongs_to :billing, inverse_of: :debts
	belongs_to :user, foreign_key: "debtor_id"
	
	validates :debtor_id, presence: true
	validates :value, presence: true
end
