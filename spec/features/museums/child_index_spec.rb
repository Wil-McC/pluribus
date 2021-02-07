require 'rails_helper'

RSpec.describe 'the museum collection page' do
  it 'shows each associated record with attrubutes' do
    basel = Museum.create!(name: "ArtBasel", open: true, cost: 18)
    welt = basel.artifacts.create(name: "Die Welt", rare: true, age: 230)
    blau = basel.artifacts.create(name: "Unterwasser Blau", rare: false, age: 76)
    amber = basel.artifacts.create(name: "Amberzauber Sieben", rare: false, age: 250)

    visit "/museums/#{basel.id}/artifacts"
  end
end
