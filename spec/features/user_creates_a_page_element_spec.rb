require 'rails_helper'

feature 'adding an element', focus: true do
  before :each do
    @user = FactoryGirl.create(:user)
    sign_in_as(@user)

    @comic = Comic.create(name: "Frank the Tank",
      description: "Super-Frank arms his guns for another round of ammo!",
      creators: "Satoshi Nakamoto",
      cover_img_url: "http://placehold.it/200x250/b0b0b0/ffffff/&text=emphasis",
      user_id: @user.id)

    @page = Page.create(chapter: 1, number: 1, name: "thing", comic_id: @comic.id, user_id: @user.id)
  end

  scenario 'user submits valid element' do
    visit new_comic_page_element_path(@comic, @page)

    fill_in "Element Image URL", with: "http://placehold.it/700x950/b0b0b0/ffffff/&text=emphasis"
    fill_in "Div id Name", with: "Frank's Rampage"
    find('#element_animation_type').find(:xpath, 'option[1]').select_option

    click_button "Add Element"

    expect(page).to have_content("Element successfully created")
    expect(page).to have_content("Page 1")
  end

  scenario 'user submits a blank element form' do
    visit new_comic_page_element_path(@comic, @page)

    click_button "Add Element"

    expect(page).to have_content("Warning: Element not created")
    expect(page).to have_content("error")
    expect(page).to have_content("Please enter either a url or upload a file.")
  end
end
