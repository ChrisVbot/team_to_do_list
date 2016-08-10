class User < ActiveRecord::Base

  has_many :teams
  has_many :lists
  
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  
end 