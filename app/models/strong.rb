class Strong < ApplicationRecord
  include Discard::Model
  default_scope -> { kept }

  has_many :words, dependent: :nullify
  has_many :forms, through: :words, uniq: true
end
