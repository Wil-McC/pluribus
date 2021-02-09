require 'rails_helper'

describe Patron, type: :model do
  describe 'relationships' do
    it { should belong_to :exhibit }
  end

  it "is sorted by boolean" do
    king_tut = Exhibit.create! name:"King Tut", open:true, cost:40
    dominic = king_tut.patrons.create!(name: "Dominic", paid:true, age:28)
    alyssa = king_tut.patrons.create!(name: "Alyssa", paid:false, age:25)

    expected = king_tut.patrons.all_paid
    expect(expected.count).to eq 1
    expect(expected[0].paid).to eq(true)
  end
end
