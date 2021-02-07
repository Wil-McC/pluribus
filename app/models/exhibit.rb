class Exhibit < ApplicationRecord
  has_many :patrons

  def self.sort_by_creation
    order(:created_at)
  end 
end
