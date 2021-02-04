class CreateMuseum < ActiveRecord::Migration[5.2]
  def change
    create_table :museums do |t|
      t.string :name
      t.boolean :open
      t.integer :cost

      t.timestamps
    end
  end
end
