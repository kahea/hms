class Program < ActiveRecord::Base

  has_many    :program_users, dependent: :destroy
  has_many    :sections

  validates   :name, presence: true, uniqueness: true
end
