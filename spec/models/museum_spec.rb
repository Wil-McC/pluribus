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
