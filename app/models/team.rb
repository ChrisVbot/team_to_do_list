class Team < ActiveRecord::Base

  has_many :users, :through => :appointments
  has_many :tasks
  
  validates :name, presence: true
  
end 