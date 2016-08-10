class User < ActiveRecord::Base

  has_many :teams, :through => :appointments
  has_many :lists
  
  validates :name, presence: true
  validates :password, presence: true
  
end 