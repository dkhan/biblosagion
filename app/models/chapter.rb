class Chapter < ApplicationRecord
  include Discard::Model
  default_scope -> { kept }

  belongs_to :book
  has_many :verses, -> { order(:number) }
  has_many :words, -> { order(:number) }
  has_many :forms, -> { unscope(:order).select(:formatted_greek).distinct }, class_name: "Word"
  has_many :features, as: :text
end
