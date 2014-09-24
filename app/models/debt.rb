class Debt < ActiveRecord::Base
	belongs_to :billing, inverse_of: :debts
	belongs_to :user, foreign_key: "debtor_id"
	default_scope -> { order('created_at DESC') }
	
	validates :debtor_id, presence: true
	validates :value, presence: true
end
