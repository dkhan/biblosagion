class AddColumnsToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :title, :string
    add_column :books, :greek_title, :string
    add_column :books, :transcription, :string
    add_column :books, :description, :string
    add_column :books, :author, :string
  end
end
