class Section < ActiveRecord::Base
  belongs_to  :program
  has_many    :section_assignments
  has_many    :section_users
  
  validates   :name, presence: true, :uniqueness => {:scope => :program_id}
end
