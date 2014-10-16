require 'rails_helper'

feature 'adding a comic' do
  before :each do
    @user = FactoryGirl.create(:user)
    sign_in_as(@user)

    @comic = Comic.create(name: "Frank the Tank",
      description: "Super-Frank arms his guns for another round of ammo!",
      creators: "Satoshi Nakamoto",
      cover_img_url: "http://placehold.it/200x250/b0b0b0/ffffff/&text=emphasis",
      user_id: @user.id)
  end

  scenario 'user submits valid comic page' do
    visit new_comic_page_path(@comic)

    fill_in "Chapter Number", with: "1"
    fill_in "Title", with: "Frank's Rampage"
    fill_in "Page Number", with: "1"
    find('#page_page_type').find(:xpath, 'option[2]').select_option

    click_button "Create Page"

    expect(page).to have_content("Page successfully created")
    expect(page).to have_content("1")
    expect(page).to have_content("Frank's Rampage")
  end

  scenario 'user submits a blank comic page form' do
    visit new_comic_page_path(@comic)

    click_button "Create Page"

    expect(page).to have_content("Warning: Page not created")
    expect(page).to have_content("error")
    expect(page).to have_content("Number can't be blank")
  end
end
