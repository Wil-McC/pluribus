require 'rails_helper'

describe Exhibit, type: :model do
  describe 'relationships' do
    it { should have_many :patrons}
  end
  # story 13
  it "counts the number of patrons in exhibits" do
    king_tut = Exhibit.create! name:"King Tut", open:true, cost:40
    dominic = king_tut.patrons.create!(name: "Dominic", paid:true, age:28)
    alyssa = king_tut.patrons.create!(name: "Alyssa", paid:false, age:25)
    expect(king_tut.patron_count).to eq 2
  end
  #story 12
  it "is able to sort in reverse by when the records were created" do
  Exhibit.destroy_all
  black_holes = Exhibit.create! name:"Black Holes", open:true, cost:75
  king_tut = Exhibit.create! name:"King Tut", open:true, cost:40
  before_Us= Exhibit.create! name:"Before Us", open:false, cost:35

  expect(Exhibit.sort_by_date).to eq([before_Us, king_tut, black_holes])
  end

  #story 16
  it "is able to sort children by alphabetical order" do
  black_holes = Exhibit.create! name:"Black Holes", open:true, cost:75
  dominic = black_holes.patrons.create!(name: "Dominic", paid:true, age:28)
  alyssa = black_holes.patrons.create!(name: "Alyssa", paid:false, age:25)
  george = black_holes.patrons.create!(name: "George", paid:false, age:19)
  expected = black_holes.sort_alpha
  expect(expected).to eq([alyssa, dominic, george])
  end

  #story 25
  it "It is able to sort by number of patrons attending" do
    Exhibit.destroy_all
    black_holes = Exhibit.create! name:"Black Holes", open:true, cost:75
    king_tut = Exhibit.create! name:"King Tut", open:true, cost:40
    before_us= Exhibit.create! name:"Before Us", open:true, cost:35

    dominic = king_tut.patrons.create!(name: "Dominic", paid:true, age:28)
    alyssa = king_tut.patrons.create!(name: "Alyssa", paid:false, age:25)

    george = before_us.patrons.create!(name: "George", paid:false, age:19)
    johnny = before_us.patrons.create!(name: "Johnny", paid:false, age:19)

    ron = black_holes.patrons.create!(name: "Ron", paid:false, age:19)
    expected = Exhibit.all.sort_by_children
    expect(expected).to eq([king_tut, before_us, black_holes])

  end

  # story 26
  it "is able to search by complete names" do
    black_holes = Exhibit.create! name:"Black Holes", open:true, cost:75
    king_tut = Exhibit.create! name:"King Tut", open:true, cost:40
    before_us= Exhibit.create! name:"Before Us", open:true, cost:35

    expected = Exhibit.search_by_name("Before Us")
    expect(expected).to eq(before_us)
    expect(expected).to_not eq(king_tut)
  end
end
