require 'rails_helper'

RSpec.describe 'the create artifact form page' do
  it 'creates a new artifact and redirects on submit' do
    chengdu = Museum.create!(name: "YiShu Chengdu", open: true, cost: 0)
    chengdu.artifacts.create(name: "Taotie", rare: true, age: 3200)

    visit "/museums/#{chengdu.id}/artifacts"

    expect(page).to have_content('Taotie')
    expect(page).to have_content('true')
    expect(page).to have_content(3200)

    click_link 'Create Artifact'

    fill_in 'artifact[name]', with: 'ZhiShi'
    fill_in 'artifact[age]', with: 1560
    click_on 'Create Artifact'

    expect(current_path).to eq("/museums/#{chengdu.id}/artifacts")
    expect(page).to have_content('Taotie')
    expect(page).to have_content('true')
    expect(page).to have_content(3200)

    expect(page).to have_content('ZhiShi')
    expect(page).to have_content('false')
    expect(page).to have_content(1560)
  end
  # story 22
  it 'has a child index link' do
    chengdu = Museum.create!(name: "YiShu Chengdu", open: true, cost: 0)
    tao = chengdu.artifacts.create(name: "Taotie", rare: true, age: 3200)

    visit "/museums/#{chengdu.id}/artifacts/new"

    expect(page).to have_link('Artifact Index')

    click_link 'Artifact Index'

    expect(current_path).to eq('/artifacts')
  end
  #story 23
  it 'has a parent index link' do
    chengdu = Museum.create!(name: "YiShu Chengdu", open: true, cost: 0)
    tao = chengdu.artifacts.create(name: "Taotie", rare: true, age: 3200)

    visit "/museums/#{chengdu.id}/artifacts/new"

    expect(page).to have_link('Museum Index')

    click_link 'Museum Index'

    expect(current_path).to eq('/museums')
  end
end
