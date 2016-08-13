class Task < ActiveRecord::Base

  belongs_to :list
  belongs_to :user
  belongs_to :team
  
  validates :content, presence: true

end 