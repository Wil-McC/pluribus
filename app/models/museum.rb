class Museum < ApplicationRecord
  has_many :artifacts, dependent: :destroy

  def self.museums_ordered
    order('created_at DESC')
  end

  def threshold(floor)
    artifacts.where('age > ?', floor)
  end
end
