class AddExhibitsToPatrons < ActiveRecord::Migration[5.2]
  def change
    add_reference :patrons, :exhibit, foreign_key: true
  end
end
