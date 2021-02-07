require 'rails_helper'

RSpec.describe 'the artifact show page' do
  it 'displays artifact with attributes' do
    chengdu = Museum.create!(name: "YiShu Chengdu", open: true, cost: 0)
    tao = chengdu.artifacts.create(name: "Taotie", rare: true, age: 3200)

    visit "/artifacts/#{tao.id}"

    expect(page).to have_content('Taotie')
    expect(page).to have_content(tao.rare)
    expect(page).to have_content(3200)
    expect(page).to have_content(tao.created_at)
    expect(page).to have_content(tao.updated_at)
    expect(page).to have_content(chengdu.id)
  end

  it 'includes an update link that redirects' do
    chengdu = Museum.create!(name: "YiShu Chengdu", open: true, cost: 0)
    tao = chengdu.artifacts.create(name: "Taotie", rare: true, age: 3200)

    visit "/artifacts/#{tao.id}"

    expect(page).to have_link('Update Artifact')
    click_link 'Update Artifact'
    expect(current_path).to eq("/artifacts/#{tao.id}/edit")
  end

  it 'includes an update link that redirects' do
    chengdu = Museum.create!(name: "YiShu Chengdu", open: true, cost: 0)
    tao = chengdu.artifacts.create(name: "Taotie", rare: true, age: 3200)

    visit "/artifacts/#{tao.id}"

    expect(page).to have_link('Delete Artifact')
  end
end
