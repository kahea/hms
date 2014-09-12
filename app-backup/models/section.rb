class Section < ActiveRecord::Base
  belongs_to  :program
  has_many    :members
end
