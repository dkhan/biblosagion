class Criterion < ApplicationRecord
  include Discard::Model
  self.table_name = 'criteria'
  
  default_scope -> { kept }
  default_scope -> { order(:category) }


  has_many :features

  validates :reference, uniqueness: true
  validates :name, uniqueness: true
end
