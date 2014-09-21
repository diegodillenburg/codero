require 'spec_helper'

describe Billing do
	before do
		@billing = Billing.new(name: "Bill", description: "BillDesc", value: 300, status: false)
		@billing.debts.new(value: 200, debtor_id: 2)
		@billing.debts.new(value: 100, debtor_id: 3)
		@billing.save
	end

	subject { @billing }
	
	it { should validate_presence_of(:name) }
	it { should validate_presence_of(:description) }
	it { should validate_presence_of(:value) }
	it { should respond_to(:status) }
	it { should respond_to(:creditor_id) }

	it { should belong_to(:user) }
	it { should have_many(:debts) }

	it { should be_valid }
end