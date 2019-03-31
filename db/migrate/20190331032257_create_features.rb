class CreateFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :features, id: :uuid do |t|
      t.string :reference
      t.string :name
      t.string :description
      t.uuid :text_id
      t.string :text_type
      t.datetime :discarded_at, index: true
      t.references :criterion, type: :uuid, index: true, foreign_key: { to_table: :criteria }

      t.timestamps
    end
  end
end
