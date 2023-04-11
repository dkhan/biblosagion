class Word < ApplicationRecord
  include Readable
  include Discard::Model

  default_scope -> { kept }
  default_scope -> { order(:testament_position) }

  belongs_to :strong, optional: true
  belongs_to :book
  belongs_to :chapter
  belongs_to :verse

  validates :reference, presence: true
  before_save :set_strong

  def set_strong
    return if strong_number.blank?
    return if strong_id.present?
    
    strong = Strong.find_by_strong_number strong_number
    return if strong.nil?
    self.strong_id = strong.id
  end

  def words
    [self]
  end

  def chars
    normalized_greek.chars
  end

  def char_count
    chars.count
  end
end
