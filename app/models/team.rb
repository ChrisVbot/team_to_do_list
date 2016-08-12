class Team < ActiveRecord::Base

  has_many :pairings
  has_many :users, through: :pairings
  has_many :lists
  has_many :tasks
  
  validates :name, presence: true
  
end 