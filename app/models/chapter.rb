class Chapter < ApplicationRecord
  include Discard::Model
  default_scope -> { kept }

  belongs_to :book
  has_many :verses, order: :number
  has_many :words, order: :testament_position
  has_many :forms, through: :words, uniq: true
end
