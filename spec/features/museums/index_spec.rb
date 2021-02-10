require 'rails_helper'

RSpec.describe 'the museums index page' do
  it 'shows each museum with attributes' do
    basel = Museum.create!(name: "ArtBasel", open: true, cost: 18)
    demet = Museum.create!(name: "Demetera", open: true, cost: 4)

    visit '/museums'

    expect(page).to have_content(basel.name)
    expect(page).to have_content(demet.name)
  end

  it 'shows museums from most recent to least' do
    basel = Museum.create!(name: "ArtBasel", open: true, cost: 18)
    demet = Museum.create!(name: "Demetera", open: true, cost: 4)
    forte = Museum.create!(name: "ItaliForte", open: false, cost: 8)

    visit '/museums'

    expect(forte.name).to appear_before(demet.name)
    expect(demet.name).to appear_before(basel.name)
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
  #story 18
  it 'has an update link associate with each museum which redirects to edit form' do
    basel = Museum.create!(name: "ArtBasel", open: true, cost: 18)
    demet = Museum.create!(name: "Demetera", open: true, cost: 4)

    visit '/museums'

    expect(page).to have_link('Update ArtBasel')
    expect(page).to have_link('Update Demetera')

    click_on 'Update ArtBasel'

    expect(current_path).to eq("/museums/#{basel.id}/edit")
  end
  # story 19
  it 'has an delete link associated with each museum' do
    basel = Museum.create!(name: "ArtBasel", open: true, cost: 18)
    demet = Museum.create!(name: "Demetera", open: true, cost: 4)

    visit '/museums'

    expect(page).to have_link('Delete ArtBasel')
    expect(page).to have_link('Delete Demetera')

    click_on 'Delete ArtBasel'

    expect(current_path).to eq("/museums")
    expect(page).to_not have_content(basel.name)
  end
  # story 22
  it 'has a child index link' do
    visit "/museums"

    expect(page).to have_link('Artifact Index')

    click_link 'Artifact Index'

    expect(current_path).to eq('/artifacts')
  end
  #story 23
  it 'has a parent index link' do
    visit "/museums"

    expect(page).to have_link('Museum Index')

    click_link 'Museum Index'

    expect(current_path).to eq('/museums')
  end
  # extension 1
  it 'has sort by artifact number link that sorts accordingly' do
    forte = Museum.create!(name: "ItaliForte", open: false, cost: 8)
    basel = Museum.create!(name: "ArtBasel", open: true, cost: 18)
    demet = Museum.create!(name: "Demetera", open: true, cost: 4)

    basel.artifacts.create(name: "Die Welt", rare: true, age: 230)
    basel.artifacts.create(name: "Unterwasser Blau", rare: false, age: 76)
    basel.artifacts.create(name: "Amberzauber Sieben", rare: false, age: 250)
    demet.artifacts.create(name: "Astrava", rare: false, age: 28)
    demet.artifacts.create(name: "Octavion", rare: true, age: 48)
    forte.artifacts.create(name: "Luvi", rare: false, age: 16)

    visit "/museums"

    expect(page).to have_link('Sort by Artifact Count')

    click_link 'Sort by Artifact Count'

    expect(current_path).to eq('/museums')
    expect(basel.name).to appear_before(demet.name)
    expect(demet.name).to appear_before(forte.name)
    expect('3').to appear_before('2')
    expect('2').to appear_before('1')
  end
end
