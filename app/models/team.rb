class Team < ActiveRecord::Base

  belongs_to :user
  has_many :lists
  
  validates :name, presence: true
  
end 