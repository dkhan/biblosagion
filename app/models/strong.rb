class Strong < ApplicationRecord
  include Readable
  include Discard::Model
  
  default_scope -> { kept }
end
