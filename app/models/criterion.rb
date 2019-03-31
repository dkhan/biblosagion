class Criterion < ApplicationRecord
  include Discard::Model
  default_scope -> { kept }
  default_scope -> { order(:number) }


  has_many :features

  validates :reference, uniqueness: true
  validates :name, uniqueness: true
end
