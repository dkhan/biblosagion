class Feature < ApplicationRecord
  include Discard::Model
  default_scope -> { kept }

  belongs_to :text, polimorphic: :true
  belongs_to :criterion
end
