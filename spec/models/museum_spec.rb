require 'rails_helper'

describe Museum, type: :model do
  describe 'relationships' do
    it { should have_many :artifacts}
  end
  # move to museums#index feature spec
  describe 'class methods' do
    describe 'Museum::museums_ordered' do
      it 'displays latest first' do
        basel = Museum.create!(name: "ArtBasel", open: true, cost: 18)
        demet = Museum.create!(name: "Demetera", open: true, cost: 4)
        forte = Museum.create!(name: "ItaliForte", open: false, cost: 8)

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
  end
end
