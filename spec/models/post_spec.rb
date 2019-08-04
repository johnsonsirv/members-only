require 'rails_helper'

RSpec.describe Post, type: :model do
 context "Validations" do
		it { is_expected.to validate_presence_of(:title) }
		
	 it do
    should validate_length_of(:title).
      is_at_least(1).is_at_most(75)
  	end
		
	 it do
    should validate_length_of(:body).
      is_at_least(1).is_at_most(250)
  	end
	end
	
	context "Associations" do
		it { should belong_to(:user) }
	end
	
end
