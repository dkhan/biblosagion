class Book < ApplicationRecord
  include Discard::Model
  default_scope -> { kept }

  has_many :chapters
  has_many :verses
  has_many :words
end
