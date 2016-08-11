class List < ActiveRecord::Base

  belongs_to :user
  belongs_to :team
  has_many :tasks

  validates :title, presence: true
  
end 