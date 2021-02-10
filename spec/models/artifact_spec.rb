require 'rails_helper'

describe Artifact, type: :model do
  describe 'relationships' do
    it { should belong_to :museum}
  end
end
