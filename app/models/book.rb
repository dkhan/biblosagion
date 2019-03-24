class Book < ApplicationRecord
  include Discard::Model
  default_scope -> { kept }

  has_many :chapters, order: :number
  has_many :words, order: :testament_position
  has_many :forms, through: :words, uniq: true
end
