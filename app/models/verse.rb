class Verse < ApplicationRecord
  include Readable
  include Discard::Model

  default_scope -> { kept }
  default_scope -> { order(:reference) }

  belongs_to :book
  belongs_to :chapter
  has_many :words, -> { order(:testament_position) }
  has_many :forms, -> { unscope(:order).select(:formatted_greek).distinct }, class_name: "Word"
end
