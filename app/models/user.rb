class User < ActiveRecord::Base

  belongs_to :team
  has_many :lists
  
  validates :name, presence: true
  validates :password, presence: true
  
end 