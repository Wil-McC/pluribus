class CreateArtefacts < ActiveRecord::Migration[5.2]
  def change
    create_table :artefacts do |t|
      t.string :name
      t.boolean :rare
      t.integer :age
      t.timestamps
    end
  end
end
