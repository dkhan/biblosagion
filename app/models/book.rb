class Book < ApplicationRecord
  include Readable
  include Discard::Model

  default_scope -> { kept }
  default_scope -> { order(:reference) }

  has_many :chapters, -> { order(:number) }
end
