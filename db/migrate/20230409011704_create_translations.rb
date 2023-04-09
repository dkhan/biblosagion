class CreateTranslations < ActiveRecord::Migration[5.2]
  def change
    create_table :translations do |t|
      t.string :version
      t.string :reference
      t.uuid :book_id
      t.uuid :chapter_id
      t.uuid :verse_id
      t.string :description
      t.string :text
      t.timestamps
    end
  end
end
