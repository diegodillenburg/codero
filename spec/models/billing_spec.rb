require 'spec_helper'

describe Billing do

	it { should respond_to(:name) }
	it { should respond_to(:description) }
	it { should respond_to(:value) }
	it { should respond_to(:status) }
	it { should respond_to(:creditor_id) }
	it { should respond_to(:debts) }

	it { should be_valid }
end