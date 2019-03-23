class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words, id: :uuid do |t|
      t.string :reference
      t.uuid :strong_id, index: true
      t.uuid :book_id
      t.uuid :chapter_id
      t.uuid :verse_id
      t.integer :position
      t.string :editions
      t.string :interlinear
      t.string :formatted_greek
      t.string :morphology
      t.string :lexical_form
      t.string :meaning, index: true
      t.string :sub_meaning
      t.string :variants
      t.integer :numeric_value
      t.datetime :discarded_at, index: true

      t.timestamps
    end

    add_index :words, [:book_id, :chapter_id, :verse_id]
  end
end
