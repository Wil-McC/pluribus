require 'rails_helper'

describe Exhibit, type: :model do
  before:each do
    @black_holes = Exhibit.create! name:"Black Holes", open:true, cost:75
    @king_tut = Exhibit.create! name:"King Tut", open:true, cost:40
    @before_us= Exhibit.create! name:"Before Us", open:false, cost:35
  end

  describe 'relationships' do
    it { should have_many :patrons}
  end
  # test for story 12 
  describe "sorted by time it was created" do
    it "sorts exhibits by time they were created" do

      expect(Exhibit.sort_by_creation).to eq([@black_holes, @king_tut, @before_us])
    end
  end
end
