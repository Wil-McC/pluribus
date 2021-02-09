class Exhibit < ApplicationRecord

  has_many :patrons, dependent: :destroy

  def self.sort_by_date
    order(created_at: :desc)
  end

  def patron_count
    patrons.count
  end

  def sort_alpha
    patrons.order(:name)
  end
end
