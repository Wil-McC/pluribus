class Patron < ApplicationRecord
  validates_presence_of :name
  belongs_to :exhibit

  def self.all_paid
    where(paid: true)
  end

  def self.filter_age(age)
    where('age > ?', age)
  end

  def self.partial_name_search(params)
    search_key = "%#{params}%"
    Patron.where("name like ?", search_key)
  end

end
