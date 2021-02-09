class AddMuseumsToArtifacts < ActiveRecord::Migration[5.2]
  def change
    add_reference :artifacts, :museum, foreign_key: true
  end
end
