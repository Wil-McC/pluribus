class ChangeArtefactsToArtifacts < ActiveRecord::Migration[5.2]
  def change
    rename_table :artefacts, :artifacts
  end
end
