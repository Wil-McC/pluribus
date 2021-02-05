require 'rails_helper'

RSpec.describe Patron do
  #story 8 test
  it "Shows the patron and all relevent attributes" do
    new_exhibit= Exhibit.create(name:"King Tut", open:true, cost:40)
    dominic = new_exhibit.patrons.create(name: "Dominic", paid:true, age:28)
    visit "/patrons/#{dominic.id}"
    expect(page).to have_content("Dominic")
    expect(page).to have_content("Paid: true")
    expect(page).to have_content("Age: 28")
  end
  #story 9 test
  it "Has a link to the update page of a child" do
    new_exhibit= Exhibit.create(name:"King Tut", open:true, cost:40)
    dominic = new_exhibit.patrons.create(name: "Dominic", paid:true, age:28)
    visit "/patrons/#{dominic.id}"
    expect(page).to have_link("Update Patron")
    click_link "Update Patron"
    expect(current_path).to eq("/patrons/#{dominic[:id]}/edit")
  end
  #story 10
  it "Has a link to delete the child" do
    new_exhibit= Exhibit.create(name:"King Tut", open:true, cost:40)
    dominic = new_exhibit.patrons.create(name: "Sanson", paid:true, age:28)
    visit "/patrons/#{dominic.id}"
      expect(page).to have_link("Delete Patron")
      click_link "Delete Patron"
      expect(current_path).to eq("/patrons")
      expect(page).to have_no_content("Sanson")
  end
end
