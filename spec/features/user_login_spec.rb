require 'rails_helper'

RSpec.feature 'User Login', type: :feature do
	before do
		params: { user: { username:  "jo_user",
											email: "jouser@gmail.com",
											password_digest: "12345678",
											password_confirmation: "12345678" } }
		
		User.create(params[:user])
	end
	scenario 'Unsuccessful Login attempt due to incorrect username.password' do
		visit login_path
		
		fill_in "Username", with: 'abiye'
		fill_in "Password", with: 'abiye_password'
		
		click_button "Login"
		
		expect(page).to have_text("Incorrect username or password")
	end
	
	scenario 'Succesful Login and redirect to posts' do
		visit login_path
		
		fill_in "Username", with: 'jo_user'
		fill_in "Password", with: '12345678'
		
		click_button "Login"
		
		expect(page).to have_text("Logged in as jo_user")
		expect(page).to have_link("Logout")
	end
end