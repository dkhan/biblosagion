class Paragraph < ApplicationRecord
  include Readable
  include Discard::Model
  
  default_scope -> { kept }
  default_scope -> { order(:reference) }

  belongs_to :book
  belongs_to :chapter

  before_save :set_reference

  def set_reference
    if end_verse_id_changed?
      self.reference = "#{start_verse.reference}-#{end_verse.reference.split('.').last}"
    end
  end

  def start_verse
    Verse.find start_verse_id
  end

  def end_verse
    Verse.find end_verse_id
  end

  def verses
    chapter.verses.select do |v|
      v.reference >= start_verse.reference &&
        v.reference <= end_verse.reference
    end
  end

  def words
    verses.map(&:words).flatten
  end
end
