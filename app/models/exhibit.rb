class Exhibit < ApplicationRecord

  validates_presence_of :name
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

  def self.sort_by_children
    joins(:patrons).group(:id).order('COUNT(exhibits.id) DESC')
  end

  def self.search_by_name(params)
    Exhibit.where("name = ?", params)
  end
end
