require 'rails_helper'

feature 'Guest registration' do
  scenario 'fill in registration form' do
    visit "/users/sign_up"

    fill_in "Username", with: "lolzors"
    fill_in "First name", with: "Charles"
    fill_in "Last name", with: "Barkley"
    fill_in "Email" , with: "fake@gmail.com"

    fill_in "Password", with: "thisismypassword"
    fill_in "Password confirmation", with: "thisismypassword"
    click_button "Sign up"

    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  scenario 'User logs out' do
    @user = FactoryGirl.create(:user)
    sign_in_as(@user)

    visit '/'

    click_link "Logout"

    expect(page).to have_content("Signed out successfully.")
  end
end
