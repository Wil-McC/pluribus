require 'rails_helper'

RSpec.describe 'the artifact index page' do
  it 'shows rare artifacts with attributes' do
    basel = Museum.create!(name: "ArtBasel", open: true, cost: 18)
    welt = basel.artifacts.create(name: "Die Welt", rare: true, age: 230)
    blau = basel.artifacts.create(name: "Unterwasser Blau", rare: false, age: 76)
    amber = basel.artifacts.create(name: "Amberzauber Sieben", rare: false, age: 250)

    visit '/artifacts'

    expect(page).to have_content('Die Welt')
    expect(page).to have_content(welt.rare)
    expect(page).to have_content(230)
    expect(page).to have_content(welt.created_at)
    expect(page).to have_content(welt.updated_at)
  end
  #story 20
  it 'has an update link associated with each artifact' do
    basel = Museum.create!(name: "ArtBasel", open: true, cost: 18)
    welt = basel.artifacts.create(name: "Die Welt", rare: true, age: 230)
    blau = basel.artifacts.create(name: "Unterwasser Blau", rare: false, age: 76)
    amber = basel.artifacts.create(name: "Amberzauber Sieben", rare: false, age: 250)

    visit '/artifacts'

    expect(page).to have_link('Update Die Welt')

    click_link 'Update Die Welt'

    expect(current_path).to eq("/artifacts/#{welt.id}/edit")
  end
  #story 21
  it 'has a delete link associated with each artifact' do
    basel = Museum.create!(name: "ArtBasel", open: true, cost: 18)
    welt = basel.artifacts.create(name: "Die Welt", rare: true, age: 230)
    blau = basel.artifacts.create(name: "Unterwasser Blau", rare: false, age: 76)
    amber = basel.artifacts.create(name: "Amberzauber Sieben", rare: false, age: 250)

    visit '/artifacts'

    expect(page).to have_link('Delete Die Welt')

    click_link 'Delete Die Welt'

    expect(current_path).to eq("/artifacts")
    expect(page).to_not have_content(welt.name)
  end
end
