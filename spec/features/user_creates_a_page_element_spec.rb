require 'rails_helper'

feature 'adding an element' do
  before :each do
    @user = FactoryGirl.create(:user)
    sign_in_as(@user)

    @comic = FactoryGirl.create(:comic, user: @user)
    @page = FactoryGirl.create(:page, user: @user, comic: @comic)
  end

  scenario 'user submits valid element' do
    visit new_comic_page_element_path(@comic, @page)

    fill_in "Element Image URL", with: "http://placehold.it/700x950/b0b0b0/ffffff/&text=emphasis"
    fill_in "Unique ID Name", with: "Frank's Rampage"
    find('#element_position').find(:xpath, 'option[1]').select_option
    find('#element_align').find(:xpath, 'option[1]').select_option

    click_button "Add Element"

    expect(page).to have_content("Element successfully created")
    expect(page).to have_content("Page #{@page.number}")
  end

  scenario 'user submits a blank element form' do
    visit new_comic_page_element_path(@comic, @page)

    click_button "Add Element"

    expect(page).to have_content("Warning: Element not created")
    expect(page).to have_content("error")
    expect(page).to have_content("Please enter either a url or upload a file.")
  end
end
