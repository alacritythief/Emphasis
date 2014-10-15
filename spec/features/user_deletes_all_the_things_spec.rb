require 'rails_helper'

feature 'user deletes all the things' do
  before :each do
    @user = FactoryGirl.create(:user)
    sign_in_as(@user)

    @comic = FactoryGirl.create(:comic, user: @user)
    @page = FactoryGirl.create(:page, user: @user, comic: @comic)
    @element = FactoryGirl.create(:element, user: @user, page_id: @page.id)
  end

  scenario 'user deletes a comic' do
    visit comic_path(@comic)

    click_on "Edit this Comic"

    click_link "Delete this comic"
    expect(page).to have_content("Comic deleted.")
  end

  scenario 'user deletes a page' do
    visit edit_comic_page_path(@comic, @page)

    click_link "Delete this page"

    expect(page).to have_content("Page deleted.")
  end

  scenario 'user deletes an element' do
    visit comic_page_elements_path(@comic, @page)

    expect(page).to have_content("#{@element.id_name}")

    click_on "Delete Element"

    expect(page).to have_content("Element deleted.")
  end
end
