require 'rails_helper'

RSpec.describe 'the museum update form page' do
  it 'can be reached from show pages' do
    basel = Museum.create!(name: "ArtBasel", open: true, cost: 18)

    visit "/museums/#{basel.id}"

    click_link 'Update Museum'

    expect(current_path).to eq("/museums/#{basel.id}/edit")
  end

  it 'updates museum information and redirects to show page' do
    basel = Museum.create!(name: "ArtBasel", open: true, cost: 18)

    visit "/museums/#{basel.id}/edit"

    fill_in 'museum[name]', with: 'Bamboozle'
    fill_in 'museum[cost]', with: 23
    click_on 'Update Museum'

    expect(current_path).to eq("/museums/#{basel.id}")
    expect(page).to have_content('Bamboozle')
    expect(page).to have_content('false')
    expect(page).to have_content(23)
  end
end
