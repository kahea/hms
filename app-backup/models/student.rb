class Student < ActiveRecord::Base
  has_one   :user
  has_many  :programs
end
