require 'rails_helper'

RSpec.feature 'Visitor Signup', type: :feature do
	scenario 'Unsuccessful signup due to invalid submission' do
		# before_count = User.count
		visit new_user_path
		
		fill_in "Username", with: 'jo_user'
		fill_in "Email", with: ' '
		fill_in "Password", with: ' '
		fill_in "Confirm Password", with: '7654321'
		
		click_button "Signup"
		
		expect(page).to have_text("Please choose a password")
		expect(page).to have_text("Please enter a valid email")
		expect { click_button "Signup" }.not_to change{ User.count}
		
	end
	scenario 'Successful signup' do
		visit new_user_path
		
		fill_in "Username", with: 'jo_user'
		fill_in "Email", with: 'jouser@yahoo.com'
		fill_in "Password", with: '1234567'
		fill_in "Confirm Password", with: '1234567'
		
		
		
		
		# expect(page).to have_text("Logged in as jo_user")
		expect { click_button "Signup" }.to change{User.count}.by(1)
	end
end