class User < ActiveRecord::Base

  has_many :pairings
  has_many :teams, through: :pairings
  has_many :lists
  
  validates :username, presence: true
  validates :password, presence: true
  
end 