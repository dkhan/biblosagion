class Verse < ApplicationRecord
  include Discard::Model
  default_scope -> { kept }

  belongs_to :book
  belongs_to :chapter
  has_many :words, order: :testament_position
  has_many :forms, through: :words, uniq: true
end
