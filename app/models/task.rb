class Task < ActiveRecord::Base

  belongs_to :list
  
  validates :content, presence: true
end 