require 'rails_helper'

describe Artifact, type: :model do
  describe 'relationships' do
    it { should belong_to :museum}
  end

  describe 'class methods' do
    describe '::show_rare' do
      it 'returns only rare items' do
        sommel = Museum.create!(name: "Sommelitsch", open: false, cost: 12)
        xtre = sommel.artifacts.create(name: "Xtreem", rare: false, age: 22)
        phin = sommel.artifacts.create(name: "Phineastris", rare: true, age: 845)
        anth = sommel.artifacts.create(name: "Anthobloc", rare: false, age: 54)

        expect(Artifact.show_rare).to eq([phin])
      end
    end
  end
end
