class AddArtifactBoolConstraints < ActiveRecord::Migration[5.2]
  def change
    change_column_null :artifacts, :rare, false
    change_column_default :artifacts, :rare, from: nil, to: false
  end
end
