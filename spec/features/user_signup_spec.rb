require 'rails_helper'

RSpec.feature 'Visitor Signup', type: :feature do
	scenario 'Unsuccessful signup due to invalid submission' do
		
		visit signup_path
		
		fill_in "Username", with: 'jo_user'
		fill_in "Email", with: ' '
		fill_in "Password", with: ' '
		fill_in "Confirm Password", with: '7654321'
		
		click_button "Signup"
		
		expect(page).to have_text "Please choose a password"
		expect(page).to have_text "Please enter a valid email"
		expect { click_button "Signup" }.not_to change{ User.count}
		
	end
	scenario 'Successful signup' do
		visit signup_path
		
		fill_in "Username", with: 'jo_user'
		fill_in "Email", with: 'jouser@yahoo.com'
		fill_in "Password", with: '1234567'
		fill_in "Confirm Password", with: '1234567'
		
		
		
		expect { click_button "Signup" }.to change{ User.count}.by(1)
		
		expect(page).to have_text "New Post"
		expect(page).to have_text "View Posts"
		expect(page).to have_current_path root_path
		expect(page).to have_link "Logout"
		
	end
end