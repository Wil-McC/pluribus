require 'rails_helper'

RSpec.describe Exhibit do
  before(:each) do
    @Black_holes = Exhibit.create! name:"Black Holes", open:true, cost:75
    @king_tut = Exhibit.create! name:"King Tut", open:true, cost:40
    @Before_Us= Exhibit.create! name:"Before Us", open:false, cost:35
  end
  # story 1 test
  it 'Can show all Exhibit names' do
    visit '/exhibits'
    expect(page).to have_content(@Black_holes.name)
    expect(page).to have_content(@king_tut.name)
    expect(page).to have_content(@Before_Us.name)
  end
    # story 3 test
  it 'Shows link that can forward us to creation page' do
    visit '/exhibits'
    expect(page).to have_link("New Exhibit")
    click_link "New Exhibit"
    expect(current_path).to eq("/exhibits/new")
    expect(page).to have_content("Enter a new Exhibit")
  end

  #story 18 test features
  it 'Shows a link that can foward us to edit page' do
  visit '/exhibits'
  #find("a[href='#{edit_users_path}']").click
  expect(page).to have_link("Edit #{@Black_holes.name}")
  click_link("Edit #{@Black_holes.name}")
  expect(current_path).to eq("/exhibits/#{@Black_holes.id}/edit")
  end

  # story 19 test features
  it 'Shows a link that can delete the specific exhibit' do
    visit '/exhibits'
    expect(page).to have_link("Delete #{@Black_holes.name}")
    click_link("Delete #{@Black_holes.name}")
    expect(current_path).to eq("/exhibits")
    expect(page).not_to have_content(@Black_holes.name)
  end
end
