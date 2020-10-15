require 'rails_helper'

describe "creating a short url", type: :feature do
  it "creates a short url with a valid url input" do
    visit '/urls/new'
    fill_in 'url_original_url', with: 'www.google.com'
    click_button 'Create Url'
    expect(page).to have_content 'Short url created:'
  end

  it "creates a short url with a valid url input" do
    visit '/urls/new'
    fill_in 'url_original_url', with: ''
    click_button 'Create Url'
    expect(page).to have_content 'Invalid url'
  end
end