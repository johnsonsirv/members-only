require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
	before do
		params = {user: {username:  "jo_user",
											email: "jouser@gmail.com",
											password: "12345678",
											password_confirmation: "12345678" 
										}  }
		
		User.create(params[:user])
	end
	
	scenario 'View posts without authentication' do
		visit posts_path
		
		expect(page).to have_text "by: anonymous"
		expect(page).to have_link "View Posts"
		
	end
	
	scenario 'View Post with authentication' do
		visit login_path
		
		fill_in "Username", with: 'jo_user'
		fill_in "Password", with: '12345678'
		
		click_button "Log in"
		
		visit posts_path
		
		expect(page).not_to have_text "by: anonymous"
		
		expect(page).to have_link "New Post"
	end
	
	scenario 'Add Post with authentication' do
		
		visit login_path
		
		fill_in "Username", with: 'jo_user'
		fill_in "Password", with: '12345678'
		
		click_button "Log in"
		
		
		visit new_post_path
		
		fill_in "Title", with: 'My first secret post'
		fill_in "Body", with: 'I am posting a secret message'
		
		click_button "Add Post"
		
		
		
		expect(page).to have_current_path posts_path
		
		expect(page).to have_text "New Post succesfuly added"
		expect(page).to have_text "My first secret post"
		expect(page).to have_text "I am posting a secret message"
		
		expect(page).not_to have_text "by: anonymous"
	end
	
	scenario 'Add Post without authentication' do
		
		visit new_post_path
		
		
		expect(page).to have_current_path login_path
		expect(page).to have_text "Please log in"
		expect(page).to have_text "Username"
		expect(page).to have_text "Password"
		expect(page).to have_link "Login"
		expect(page).to have_link "Signup"
	end
	
	scenario 'Add Post with authentication, but invalid parameters' do
		
		visit login_path
		
		fill_in "Username", with: 'jo_user'
		fill_in "Password", with: '12345678'
		
		click_button "Log in"
		
		
		visit new_post_path
		
		fill_in "Title", with: ''
		fill_in "Body", with: ''
		
		click_button "Add Post"
		
		
		expect(page).not_to have_text "New Post succesfuly added"
		expect(page).to have_text "Title"
		expect(page).to have_text "Body"
		expect(page).not_to have_text "by: anonymous"
	end
	
end