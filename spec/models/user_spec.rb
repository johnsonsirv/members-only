require 'rails_helper'

RSpec.describe User, type: :model do
	context "validations" do
		it { is_expected.to have_secure_password }
		it { is_expected.to validate_presence_of(:username).with_message(/Please choose a username/) }
		it { is_expected.to validate_presence_of(:email).with_message(/Please enter a valid email/) }
		it { is_expected.to validate_presence_of(:password).with_message(/Please choose a password/) }
		it { is_expected.to validate_length_of(:username).with_message(/Username too long. Maximum of 16 characters/) }
		it { is_expected.to validate_length_of(:password).with_message(/Password length too short or long. 6-16 characters/) }
	end
end