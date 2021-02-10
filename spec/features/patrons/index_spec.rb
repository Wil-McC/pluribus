require 'rails_helper'

describe 'On the child index page I see child and attributes' do
  #story 6
  it 'I see name of each patron in the system' do
    king_tut = Exhibit.create! name:"King Tut", open:true, cost:40
    dominic = king_tut.patrons.create!(name: "Dominic", paid:true, age:28)
    alyssa = king_tut.patrons.create!(name: "Alyssa", paid:false, age:25)
    visit '/patrons'
    expect(page).to have_link("Dominic")
    expect(page).to have_content("Paid: true")
    expect(page).to have_content("Age: 28")
  end

  #story 14
  it "is sorted by boolean" do
    king_tut = Exhibit.create! name:"King Tut", open:true, cost:40
    dominic = king_tut.patrons.create!(name: "Dominic", paid:true, age:28)
    alyssa = king_tut.patrons.create!(name: "Alyssa", paid:false, age:25)
    visit '/patrons'
    expect(page).to have_content(dominic.name)
    expect(page).not_to have_content(alyssa.name)
  end
  # story 27 feature test
  it "when I arrive at the patrons page I see a text box to search by partial keyword" do
    king_tut = Exhibit.create! name:"King Tut", open:true, cost:40
    dominic = king_tut.patrons.create!(name: "Dominic", paid:true, age:28)
    alyssa = king_tut.patrons.create!(name: "Alyssa", paid:false, age:25)
    ryssa = king_tut.patrons.create!(name: "Ryssa", paid:true, age:27)
    visit '/patrons'
    expect(page).to have_content("Partial search for patron names")
    fill_in :search, with: "yssa"
    click_button("Search")
    expect(current_path).to eq("/patrons")
    expect(page).to have_content(alyssa.name)
    expect(page).to have_content(ryssa.name)
    expect(page).not_to have_content(dominic.name)  
  end
end
