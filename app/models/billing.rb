class Billing < ActiveRecord::Base
	belongs_to :user, foreign_key: "creditor_id"
	has_many :debts, dependent: :destroy
	accepts_nested_attributes_for :debts, allow_destroy: true
	default_scope -> { order('created_at DESC') }

	validates :name, presence: true, length: { maximum: 32 }
	validates :description, presence: true, length: { maximum: 64 }
	validates :value, presence: true, numericality: { greater_than: 0 }

	validate :sum_of_debts
		def sum_of_debts
			sum = 0
			self.debts.each do |debt|
				sum += debt.value
			end
			errors.add(:value, "sum of debts must eq total value") unless sum == self.value
		end
	# validate teste_tomate
	# 	def teste_tomate
	# 		sum = 0
	# 		self.debts.each do |debt|
	# 			sum += debt.value
	# 		end
	# 		errors.add(:value, "sum of debts must eq total value") unless sum == self.value
	# 	end
end
