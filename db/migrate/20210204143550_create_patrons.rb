class CreatePatrons < ActiveRecord::Migration[5.2]
  def change
    create_table :patrons do |t|
      t.string :name
      t.boolean :paid
      t.integer :age

      t.timestamps 
    end
  end
end
