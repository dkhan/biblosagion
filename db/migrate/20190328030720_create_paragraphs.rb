class CreateParagraphs < ActiveRecord::Migration[5.2]
  def change
    create_table :paragraphs, id: :uuid do |t|
      t.string :reference
      t.string :header
      t.uuid :book_id
      t.uuid :chapter_id
      t.uuid :start_verse_id
      t.uuid :end_verse_id
      t.integer :numeric_value
      t.datetime :discarded_at, index: true

      t.timestamps
    end
  end
end
