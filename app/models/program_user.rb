class ProgramUser < ActiveRecord::Base
  belongs_to    :program
  belongs_to    :user
  validates     :user_id, :uniqueness => { :scope => :program_id}
end
