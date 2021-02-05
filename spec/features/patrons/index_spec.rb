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
    expect(page).to have_link("Alyssa")
    expect(page).to have_content("Paid: false")
    expect(page).to have_content("Age: 25")
  end
end
