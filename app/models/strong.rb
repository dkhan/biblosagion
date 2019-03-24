class Strong < ApplicationRecord
  include Discard::Model
  default_scope -> { kept }

  has_many :words, dependent: :nullify
  has_many :forms, -> { unscope(:order).select(:formatted_greek).distinct }, class_name: "Word"
end
