class AddSpeakerToWords < ActiveRecord::Migration[5.2]
  def change
    add_column :words, :speaker, :string
  end
end
