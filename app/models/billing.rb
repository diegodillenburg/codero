class Billing < ActiveRecord::Base
	belongs_to :user, foreign_key: "creditor_id"
	has_many :debts, dependent: :destroy, inverse_of: :billing
	accepts_nested_attributes_for :debts, allow_destroy: true
	default_scope -> { order('created_at DESC') }

	validates :name, presence: true, length: { maximum: 32 }
	validates :description, presence: true, length: { maximum: 64 }
	validates :value, presence: true, numericality: { greater_than: 0 }
	validates :debts, presence: true;
	validate :must_have_debts
	validate :sum_of_debts

	private
		def must_have_debts
			if debts.empty? or debts.all? { |debt| debt.marked_for_destruction? }
				errors.add(:debts, "Must have at least one debt")
			end
		end

		def sum_of_debts
			sum = 0
			self.debts.each do |debt|
				sum += debt.value unless debt.value.blank?
			end
			errors.add(:value, "Sum of debts must equal total value") unless sum == self.value
		end		
end
