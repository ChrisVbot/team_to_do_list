class UserTeamPairings < ActiveRecord::Base
  belongs_to :user
  belogns_to :team
end