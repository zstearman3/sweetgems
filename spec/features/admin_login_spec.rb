require 'rails_helper'

feature "Admin Login" do
  scenario "with invalid information" do
    log_in_with 'invalid_email', 'password'
    
    expect(page).to have_content("Invalid email/password combination")
    visit root_url
    
    expect(page).to_not have_content("Invalid email/password combination")
  end
  
  scenario "With valid information" do
    log_in_with("admin@example.com", "password")
    
    expect(page).to have_content("Welcome, Test User!")
    expect(page).to have_link("users")
  end
  
  def log_in_with(email, password)
    visit admin_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Log in'
  end
end
