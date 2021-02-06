require 'rails_helper'

RSpec.describe "New Page" do
  #story 3
  it 'can create a new entry in the index page' do
    visit '/exhibits'
    expect(page).to have_link("New Exhibit")
    click_on "New Exhibit"
    expect(current_path).to eq('/exhibits/new')
    fill_in 'exhibit[name]', with: "Plays of the 1980s"
    check "exhibit[open]"
    fill_in 'exhibit[cost]', with: 1000

    click_on "Create Exhibit"

    expect(current_path).to eq("/exhibits")
    expect(page).to have_content("Plays of the 1980s")
  end
end
