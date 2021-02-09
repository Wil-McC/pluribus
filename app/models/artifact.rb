class Artifact < ApplicationRecord
  belongs_to :museum

  def self.show_rare
    where(rare: true)
  end

  # def self.threshold(floor)
    # Artifact.where(age > floor)
  # end
end
