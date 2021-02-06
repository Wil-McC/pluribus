require 'rails_helper'

RSpec.describe 'the museums index page' do
  it 'shows each museum with attributes' do
    basel = Museum.create!(name: "ArtBasel", open: true, cost: 18)
    demet = Museum.create!(name: "Demetera", open: true, cost: 4)

    visit '/museums'

    expect(page).to have_content(basel.name)
    expect(page).to have_content(demet.name)
  end

  it 'has a button for museum creation' do
    basel = Museum.create!(name: "ArtBasel", open: true, cost: 18)
    demet = Museum.create!(name: "Demetera", open: true, cost: 4)

    visit '/museums'

    expect(page).to have_link("New Museum")
  end

  it 'sends user to new museum form on clicking new museum' do
    visit '/museums'

    click_link "New Museum"
    expect(current_path).to eq('/museums/new')
  end
end
