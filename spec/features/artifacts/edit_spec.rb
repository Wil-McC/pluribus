require 'rails_helper'

RSpec.describe 'the artifact edit form page' do
  it 'updates artifact and redirects on form submit' do
    chengdu = Museum.create!(name: "YiShu Chengdu", open: true, cost: 0)
    tao = chengdu.artifacts.create(name: "Taotie", rare: true, age: 3200)

    visit "/artifacts/#{tao.id}/edit"

    fill_in 'artifact[name]', with: 'BaiShen'
    fill_in 'artifact[age]', with: 1200
    click_on 'Update Artifact'
    expect(current_path).to eq("/artifacts/#{tao.id}")
    expect(page).to have_content('BaiShen')
    expect(page).to have_content('false')
    expect(page).to have_content(1200)
    expect(page).to have_content(chengdu.id)

    expect(page).not_to have_content('Taotie')
    expect(page).not_to have_content('true')
    expect(page).not_to have_content(3200)
  end
  # story 22
  it 'has a child index link' do
    chengdu = Museum.create!(name: "YiShu Chengdu", open: true, cost: 0)
    tao = chengdu.artifacts.create(name: "Taotie", rare: true, age: 3200)

    visit "/artifacts/#{tao.id}/edit"

    expect(page).to have_link('Artifact Index')

    click_link 'Artifact Index'

    expect(current_path).to eq('/artifacts')
  end
  #story 23
  it 'has a parent index link' do
    chengdu = Museum.create!(name: "YiShu Chengdu", open: true, cost: 0)
    tao = chengdu.artifacts.create(name: "Taotie", rare: true, age: 3200)

    visit "/artifacts/#{tao.id}/edit"

    expect(page).to have_link('Museum Index')

    click_link 'Museum Index'

    expect(current_path).to eq('/museums')
  end
end
