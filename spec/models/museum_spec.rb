require 'rails_helper'

describe Museum, type: :model do
  describe 'relationships' do
    it { should have_many :artifacts}
  end

  describe 'class methods' do
    describe 'Museum::museums_ordered' do
      it 'displays latest first' do
        basel = Museum.create!(name: "ArtBasel", open: true, cost: 18)
        demet = Museum.create!(name: "Demetera", open: true, cost: 4)
        forte = Museum.create!(name: "ItaliForte", open: false, cost: 8)

        expect(Museum.museums_ordered).to eq([forte, demet, basel])
      end
    end
    describe '::museums_by_collection' do
      it 'sorts by artifact count descending' do
        forte = Museum.create!(name: "ItaliForte", open: false, cost: 8)
        basel = Museum.create!(name: "ArtBasel", open: true, cost: 18)
        demet = Museum.create!(name: "Demetera", open: true, cost: 4)

        basel.artifacts.create(name: "Die Welt", rare: true, age: 230)
        basel.artifacts.create(name: "Unterwasser Blau", rare: false, age: 76)
        basel.artifacts.create(name: "Amberzauber Sieben", rare: false, age: 250)
        demet.artifacts.create(name: "Astrava", rare: false, age: 28)
        demet.artifacts.create(name: "Octavion", rare: true, age: 48)
        forte.artifacts.create(name: "Luvi", rare: false, age: 16)

        expect(Museum.museums_by_collection).to eq([basel, demet, forte])
      end
    end
  end

  describe 'instance methods' do
    describe '#threshold' do
      it 'returns only artifacts above threshold age' do
        camber = Museum.create!(name: "CamberMass", open: true, cost: 6)
        aloy = camber.artifacts.create(name: "Aloysious II", rare: false, age: 125)
        timi = camber.artifacts.create(name: "Timicken", rare: false, age: 62)
        phan = camber.artifacts.create(name: "Phantasmicit L2", rare: false, age: 125)

        expect(camber.threshold(100)).to eq([aloy, phan])
      end
    end

    describe '#collection_alpha' do
      it 'returns musuems alphabetical' do
        sommel = Museum.create!(name: "Sommelitsch", open: false, cost: 12)
        xtre = sommel.artifacts.create(name: "Xtreem", rare: false, age: 22)
        phin = sommel.artifacts.create(name: "Phineastris", rare: true, age: 845)
        anth = sommel.artifacts.create(name: "Anthobloc", rare: false, age: 54)

        expect(sommel.collection_alpha).to eq([anth, phin, xtre])
      end
    end
  end
end
