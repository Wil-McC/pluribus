class Patron < ApplicationRecord
  validates_presence_of :name
  belongs_to :exhibit

  def self.all_paid
    where(paid: true)
  end

  def self.filter_age(age)
    where('age > ?', age)
  end

end
