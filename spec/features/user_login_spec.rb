require 'rails_helper'

RSpec.feature 'Member Authentication', type: :feature do
	before do
		params = {user: {username:  "jo_user",
											email: "jouser@gmail.com",
											password: "12345678",
											password_confirmation: "12345678" 
										}  }
		
		User.create(params[:user])
	end
	
	scenario 'Unsuccessful Login attempt due to incorrect username or password' do
		visit login_path
		
		fill_in "Username", with: 'abiye'
		fill_in "Password", with: 'abiye_password'
		
		click_button "Log in"
		
		expect(page).to have_text("Incorrect username or password")
	end
	
	scenario 'Succesful Login' do
		visit login_path
		
		fill_in "Username", with: 'jo_user'
		fill_in "Password", with: '12345678'
		
		click_button "Log in"
		
		expect(page).to have_text("New Post")
		expect(page).to have_text("View Posts")
		expect(page).to have_link("Logout")
	end
	
	scenario 'Logout and redirect to login page' do
		
		visit login_path
		
		fill_in "Username", with: 'jo_user'
		fill_in "Password", with: '12345678'
		
		click_button "Log in"
		
		visit "Logout"
		
		
		expect(page).to have_current_path(login_path)
		expect(page).to have_text("Username")
		expect(page).to have_text("Passowrd")
		expect(page).to have_text("Log in")
	end
	
end