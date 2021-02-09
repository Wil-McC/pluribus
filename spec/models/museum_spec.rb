require 'rails_helper'

describe Museum, type: :model do
  describe 'relationships' do
    it { should have_many :artifacts}
  end 
end
