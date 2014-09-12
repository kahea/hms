class Program < ActiveRecord::Base
  belongs_to :user
  
  # has_many  :assignments, through: :sections
  # has_many  :members, through: :sections
  # has_one   :group

  validates :name, presence: true, uniqueness: true
end
