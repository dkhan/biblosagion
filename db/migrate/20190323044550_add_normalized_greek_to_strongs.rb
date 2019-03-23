class AddNormalizedGreekToStrongs < ActiveRecord::Migration[5.2]
  def change
    add_column :strongs, :normalized_greek, :string, index: true
  end
end
