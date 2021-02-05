require 'rails_helper'

RSpec.describe Exhibit do
  #story 2 test
  it "can show parent's expected attributes" do
    king_tut = Exhibit.create! name:"King Tut", open:true, cost:40
    visit "/exhibits/#{king_tut.id}"

    expect(page).to have_content(king_tut.name)
    expect(page).to have_content(king_tut.open)
    expect(page).to have_content(king_tut.cost)
    expect(page).to have_content(king_tut.updated_at)
    expect(page).to have_content(king_tut.created_at)
  end
  # story 4 test not passing yet 
  it "Shows a link to update the parent on the page" do
    king_tut = Exhibit.create! name:"King Tut", open:true, cost:40
    visit "/exhibits/#{king_tut[:id]}"

    expect(page).to have_link("Update Exhibit")
    click_link "Update Exhibit"
    expect(current_path).to eq("/exhibits/#{king_tut[:id]}/edit")
    expect(page).to have_content("Submit")
  end
  # Story 5 test
  it "Shows a button to delete parent on the page" do
    king_tut = Exhibit.create! name:"King Tut kdkdkdk", open:true, cost:40
    visit "/exhibits/#{king_tut[:id]}"
    expect(page).to have_button("Delete")
    click_button "Delete"
    expect(current_path).to eq("/exhibits")
    expect(page).to have_no_content("King Tut kdkdkdk")
  end
end
