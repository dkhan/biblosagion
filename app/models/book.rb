class Book < ApplicationRecord
  include Discard::Model
  default_scope -> { kept }

  has_many :chapters, -> { order(:number) }
  has_many :words, -> { order(:testament_position) }
  has_many :forms, -> { unscope(:order).select(:formatted_greek).distinct }, class_name: "Word"
end
