class RenameStrongColumns < ActiveRecord::Migration[5.2]
  def change
    rename_column :strongs, :morph,   :translit
    rename_column :strongs, :meaning, :morphology
    rename_column :strongs, :gloss,   :meaning
  end
end
