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
  it 'has a link to delete museum' do
    basel = Museum.create!(name: "ArtBasel", open: true, cost: 18)

    visit "/museums/#{basel.id}"

    expect(page).to have_link('Delete Museum')
  end

  it 'deletes record when delete link is clicked' do
    basel = Museum.create!(name: "ArtBasel", open: true, cost: 18)
    demet = Museum.create!(name: "Demetera", open: true, cost: 4)

    visit "/museums/#{demet.id}"

    click_link 'Delete Museum'

    expect(current_path).to eq('/museums')
    expect(page).not_to have_content('Demetera')
  end
end
