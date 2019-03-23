class Verse < ApplicationRecord
  include Discard::Model
  default_scope -> { kept }

  belongs_to :book
  belongs_to :chapter
  has_many :words
end
