class Museum < ApplicationRecord
  has_many :artifacts, dependent: :destroy
end
