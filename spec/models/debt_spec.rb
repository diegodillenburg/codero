require 'spec_helper'

describe Debt do

	it { should respond_to(:user_id) }
	it { should respond_to(:value) }

	it { should be_valid }
end