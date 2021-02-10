require 'rails_helper'

RSpec.describe 'Index' do
  it "can display count of patrons per exhibit" do
    black_holes = Exhibit.create! name:"Black Holes", open:true, cost:75
    king_tut = Exhibit.create! name:"King Tut", open:true, cost:40
    before_Us= Exhibit.create! name:"Before Us", open:false, cost:35
    dominic = king_tut.patrons.create!(name: "Dominic", paid:true, age:28)
    alyssa = king_tut.patrons.create!(name: "Alyssa", paid:false, age:25)
    visit "/exhibits/#{king_tut.id}/patrons"
    expect(page).to have_content("2 patrons are inside the exhibit")
  end


  it "can sort by creation" do
  black_holes = Exhibit.create! name:"Black Holes", open:true, cost:75
  king_tut = Exhibit.create! name:"King Tut", open:true, cost:40
  before_us= Exhibit.create! name:"Before Us", open:false, cost:35
  visit '/exhibits'
  expect(king_tut.name).to appear_before(black_holes.name)
  end

  # story 15
  it "can give take a value and return everything above the threshold" do
    black_holes = Exhibit.create! name:"Black Holes", open:true, cost:75
    king_tut = Exhibit.create! name:"King Tut", open:true, cost:40
    before_Us= Exhibit.create! name:"Before Us", open:false, cost:35
    dominic = king_tut.patrons.create!(name: "Dominic", paid:true, age:28)
    alyssa = king_tut.patrons.create!(name: "Alyssa", paid:false, age:25)
      visit "/exhibits/#{king_tut.id}/patrons"
      expect(page).to have_button("Enter age threshold")
      fill_in(:age, with:26)
      click_button("Enter age threshold")

      expect(current_path).to eq("/exhibits/#{king_tut.id}/patrons")
      expect(page).to have_content(dominic.name)
      expect(page).to_not have_content(alyssa.name)

  end
  # story 16
  it "can return names in alphabetical order" do
  king_tut = Exhibit.create! name:"King Tut", open:true, cost:40
  dominic = king_tut.patrons.create!(name: "Dominic", paid:true, age:28)
  alyssa = king_tut.patrons.create!(name: "Alyssa", paid:true, age:25)
  johnny = king_tut.patrons.create!(name: "Johnny", paid:true, age: 31)
    visit "/exhibits/#{king_tut.id}/patrons"
    expect(page).to have_link("Sort Patrons alphabetically by name")
    click_link("Sort Patrons alphabetically by name")

    expect(alyssa.name).to appear_before(dominic.name)
    expect(dominic.name).to appear_before(johnny.name)
  end

  #story 25
  it "When I arrive on show page I see a link that will sort parents by number of children" do
    visit '/exhibits'
    expect(page).to have_link("See Exhibits by patrons attending")
    click_link("See Exhibits by patrons attending")
    expect(current_path).to eq("/exhibits")
  end
end
