class Instructor < ActiveRecord::Base
  has_many    :programs, :resources
end
