class Task < ActiveRecord::Base

  belongs_to :user
  belongs_to :team
  has_many :items

  validates :content, presence: true
  
end 