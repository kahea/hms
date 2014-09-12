class Member < ActiveRecord::Base
  belongs_to    :section
  has_one       :student
end
