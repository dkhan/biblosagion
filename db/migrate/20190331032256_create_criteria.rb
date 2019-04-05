class CreateCriteria < ActiveRecord::Migration[5.2]
  def change
    create_table :criteria, id: :uuid do |t|
      t.string :category
      t.string :reference
      t.string :name
      t.string :description
      t.datetime :discarded_at, index: true

      t.timestamps
    end
  end
end
