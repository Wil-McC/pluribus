require 'rails_helper'

RSpec.describe 'the artifact index page' do
  it 'shows each artifact with attributes' do
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

    expect(page).to have_content('Unterwasser Blau')
    expect(page).to have_content(blau.rare)
    expect(page).to have_content(76)
    expect(page).to have_content(blau.created_at)
    expect(page).to have_content(blau.updated_at)

    expect(page).to have_content('Amberzauber Sieben')
    expect(page).to have_content(amber.rare)
    expect(page).to have_content(250)
    expect(page).to have_content(amber.created_at)
    expect(page).to have_content(amber.updated_at)
  end
end
