class Word < ApplicationRecord
  include Discard::Model
  default_scope -> { kept }

  has_one :strong
  # the following should be changed to belongs_to after populating the data
  has_one :book
  has_one :chapter
  has_one :verse
end
