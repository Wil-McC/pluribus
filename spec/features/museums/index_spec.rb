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
end
