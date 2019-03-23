class Chapter < ApplicationRecord
  include Discard::Model
  default_scope -> { kept }

  belongs_to :book
  has_many :verses
  has_many :words
end
