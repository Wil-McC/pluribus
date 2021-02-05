require 'rails_helper'

describe Patron, type: :model do
  describe 'relationships' do
    it { should belong_to :exhibit }
  end
end
