class Word < ApplicationRecord
  include Discard::Model
  default_scope -> { kept }

  belongs_to :strong
  belongs_to :book
  belongs_to :chapter
  belongs_to :verse
end
