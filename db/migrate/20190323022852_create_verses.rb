class CreateVerses < ActiveRecord::Migration[5.2]
  def change
    create_table :verses, id: :uuid do |t|
      t.uuid :book_id
      t.uuid :chapter_id
      t.string :reference
      t.integer :number
      t.integer :numeric_value
      t.datetime :discarded_at, index: true

      t.timestamps
    end
  end
end
