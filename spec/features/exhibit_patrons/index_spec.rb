require 'rails_helper'

RSpec.describe 'Index' do
  describe "When on parent/child index page" do
    @Black_holes = Exhibit.create! name:"Black Holes", open:true, cost:75
    @king_tut = Exhibit.create! name:"King Tut", open:true, cost:40
    @Before_Us= Exhibit.create! name:"Before Us", open:false, cost:35
    @dominic = king_tut.patrons.create!(name: "Dominic", paid:true, age:28)
    @alyssa = king_tut.patrons.create!(name: "Alyssa", paid:false, age:25)

  end
end
