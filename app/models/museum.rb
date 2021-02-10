class Museum < ApplicationRecord
  has_many :artifacts, dependent: :destroy

  def self.museums_ordered
    order('created_at DESC')
  end

  def threshold(floor)
    artifacts.where("age > #{floor}")
  end

  def collection_alpha
    artifacts.order(:name)
  end

  def self.museums_by_collection
    joined = joins(:artifacts).group(:id).order('COUNT(artifacts.id) DESC')
  end
end
