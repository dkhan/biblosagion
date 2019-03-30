class Paragraph < ApplicationRecord
  include Discard::Model
  default_scope -> { kept }

  belongs_to :book
  belongs_to :chapter
  has_one :start_verse, class_name: "Verse"
  has_one :end_verse, class_name: "Verse"

  before_save :set_reference

  def set_reference
    if end_verse_id_changed?
      self.reference = "#{start_verse.reference}-#{end_verse.reference.split('.').last}"
    end
  end
end
