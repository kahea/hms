class Section < ActiveRecord::Base
  belongs_to  :program
  has_many    :assignments
  validates   :name, presence: true, :uniqueness => {:scope => :program_id}
end

