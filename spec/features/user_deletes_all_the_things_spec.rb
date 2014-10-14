require 'rails_helper'

feature 'user deletes all the things' do
  before :each do
    @user = FactoryGirl.create(:user)
    sign_in_as(@user)

    @comic = FactoryGirl.create(:comic, user: @user)
    @page = FactoryGirl.create(:page, user: @user, comic: @comic)
  end

  scenario 'user deletes a comic' do
    visit comic_path(@comic)

    click_on "Edit this Comic"

    click_link "Delete this comic"
    expect(page).to have_content("Comic deleted.")
  end

  scenario 'user deletes a page' do
    visit comic_pages_path(@comic, @page)

    click_on "Edit this Page"
    click_link "Delete this page"

    expect(page).to have_content("Page deleted.")
  end
end
