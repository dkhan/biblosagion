class Word < ApplicationRecord
  include Readable
  include Discard::Model

  default_scope -> { kept }
  default_scope -> { order(:testament_position) }

  belongs_to :strong
  belongs_to :book
  belongs_to :chapter
  belongs_to :verse

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
