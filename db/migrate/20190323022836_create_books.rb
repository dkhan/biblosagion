class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books, id: :uuid do |t|
      t.string :reference
      t.integer :number
      t.string :name
      t.string :abbreviation
      t.integer :numeric_value
      t.datetime :discarded_at, index: true

      t.timestamps
    end
  end
end
