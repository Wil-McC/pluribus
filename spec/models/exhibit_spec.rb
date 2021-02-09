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
end
