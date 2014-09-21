require 'spec_helper'

describe Debt do

	it { should validate_presence_of(:debtor_id)}
	it { should validate_presence_of(:value) }

	it { should belong_to(:user) }
	it { should belong_to(:billing) }
	
	# it { should be_valid }
end