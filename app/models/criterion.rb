class Criterion < ApplicationRecord
  include Discard::Model
  default_scope -> { kept }

  has_many :features
end
