require "rails_helper"

RSpec.describe Patron do
  it "On the edit page I can change specific attributes" do
    new_exhibit = Exhibit.create(name:"King Tut", open:true, cost:40)
    dominic = new_exhibit.patrons.create(name: "Dominic", paid:true, age:28)
    visit "/patrons/#{dominic[:id]}/edit"
    expect(page).to have_content("Edit Patron")

    fill_in 'patron[name]', with: "Johanna"
    check "patron[paid]"
    fill_in 'patron[age]', with: 45
    click_on 'Update Patron'
    expect(current_path).to eq("/patrons/#{dominic.id}")
    expect(page).to have_content("Johanna")
    expect(page).to have_content("45")
  end
end
