class Verse < ApplicationRecord
  include Readable
  include Discard::Model

  default_scope -> { kept }
  default_scope -> { order(:reference) }

  belongs_to :book
  belongs_to :chapter
  has_many :translations
end
