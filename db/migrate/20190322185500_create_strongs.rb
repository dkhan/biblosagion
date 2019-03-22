class CreateStrongs < ActiveRecord::Migration[5.2]
  def change
    create_table :strongs, id: :uuid do |t|
      t.string :strong_number
      t.string :gloss
      t.string :greek
      t.string :morph
      t.string :meaning
      t.text :description
      t.datetime :discarded_at

      t.timestamps
    end

    add_index :strongs, :strong_number
    add_index :strongs, :gloss
    add_index :strongs, :greek
    add_index :strongs, :discarded_at
  end
end
