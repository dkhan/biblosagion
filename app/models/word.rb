class Word < ApplicationRecord
  include Discard::Model
  default_scope -> { kept }
  default_scope -> { order(:testament_position) }

  belongs_to :strong
  belongs_to :book
  belongs_to :chapter
  belongs_to :verse
  has_many :features, as: :text
end
