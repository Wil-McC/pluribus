require 'rails_helper'

RSpec.describe 'museum show pages' do
  it 'display museum attribute content' do
    basel = Museum.create!(name: "ArtBasel", open: true, cost: 18)

    visit "/museums/#{basel.id}"

    expect(page).to have_content(basel.name)
    expect(page).to have_content(basel.open)
    expect(page).to have_content(basel.cost)
    expect(page).to have_content(basel.created_at)
    expect(page).to have_content(basel.updated_at)
  end

  it 'has a link to update museum' do
    basel = Museum.create!(name: "ArtBasel", open: true, cost: 18)

    visit "/museums/#{basel.id}"

    expect(page).to have_link('Update Museum')
  end
end
