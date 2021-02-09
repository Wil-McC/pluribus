require 'rails_helper'

describe Patron, type: :model do
  describe 'relationships' do
    it { should belong_to :exhibit }
  end
  #story 14
  it "is sorted by boolean" do
    king_tut = Exhibit.create! name:"King Tut", open:true, cost:40
    dominic = king_tut.patrons.create!(name: "Dominic", paid:true, age:28)
    alyssa = king_tut.patrons.create!(name: "Alyssa", paid:false, age:25)

    expected = king_tut.patrons.all_paid
    expect(expected.count).to eq 1
    expect(expected[0].paid).to eq(true)
  end
  # story 15 model test
  it "does not show records over a given threshold" do
    king_tut = Exhibit.create! name:"King Tut", open:true, cost:40
    dominic = king_tut.patrons.create!(name: "Dominic", paid:true, age:28)
    alyssa = king_tut.patrons.create!(name: "Alyssa", paid:false, age:25)
    george = king_tut.patrons.create!(name: "George", paid:false, age:19)
    expected = king_tut.patrons.filter_age(20)
    expect(expected.count).to eq(2)
  end
end
