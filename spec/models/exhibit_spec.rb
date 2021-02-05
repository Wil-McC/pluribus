require 'rails_helper'

describe Exhibit, type: :model do
  describe 'relationships' do
    it { should have_many :patrons}
  end 
end
