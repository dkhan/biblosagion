class Chapter < ApplicationRecord
  include Readable
  include Discard::Model
  
  default_scope -> { kept }
  default_scope -> { order(:reference) }

  belongs_to :book
  has_many :verses, -> { order(:number) }
  has_many :words, -> { order(:number) }
  has_many :forms, -> { unscope(:order).select(:formatted_greek).distinct }, class_name: "Word"
end
