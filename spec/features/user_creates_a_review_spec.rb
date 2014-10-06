require 'rails_helper'

feature 'adding a comic' do
  before :each do
    @comic = Comic.create(name: "Frank the Tank",
      description: "Super-Frank arms his guns for another round of ammo!",
      creators: "Satoshi Nakamoto")
  end

  scenario 'user submits valid comic page' do
    visit new_comic_page_path(@comic)

    fill_in "Chapter", with: "1"
    fill_in "Name", with: "Frank's Rampage"
    fill_in "Number", with: "1"
    find('#page_page_type').find(:xpath, 'option[1]').select_option

    click_button "Add Page"

    expect(page).to have_content("Page successfully created")
    expect(page).to have_content("1")
    expect(page).to have_content("Frank's Rampage")
  end

  scenario 'user submits a blank comic page form' do
    visit new_comic_page_path(@comic)

    click_button "Add Page"

    expect(page).to have_content("Warning: Page not created")
    expect(page).to have_content("error")
    expect(page).to have_content("Number can't be blank")
  end
end
