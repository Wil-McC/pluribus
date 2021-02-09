class Artifact < ApplicationRecord
  belongs_to :museum

  def self.show_rare
    where(rare: true)
  end
end
