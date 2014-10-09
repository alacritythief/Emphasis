require 'rails_helper'

feature 'adding a comic page' do
  before :each do
    @user = FactoryGirl.create(:user)
    sign_in_as(@user)
  end

  scenario 'user submits valid comic' do
    visit '/comics/new'

    fill_in "Cover Image URL", with: "http://placehold.it/200x250/b0b0b0/ffffff/&text=emphasis"
    fill_in "Name", with: "Frank the Tank"
    fill_in "Description", with: "Super-Frank arms his guns for another round of ammo!"
    fill_in "Creators", with: "Satoshi Nakamoto"

    click_on "Add Comic"

    expect(page).to have_content("Comic added successfully.")
    expect(page).to have_content("Frank the Tank")
    expect(page).to have_content("Super-Frank arms his guns for another round of ammo!")
    expect(page).to have_content("Satoshi Nakamoto")
  end

  scenario 'user submits a blank comic form' do
    visit '/comics/new'

    click_link "Add Comic"

    expect(page).to have_content("Warning: We couldn't post your comic!")
    expect(page).to have_content("errors")
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Creators can't be blank")
  end
end
