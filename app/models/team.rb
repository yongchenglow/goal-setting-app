class Team < ApplicationRecord
  belongs_to :created_by, class_name: 'User'
  belongs_to :updated_by, class_name: 'User'
  belongs_to :organization
  has_many :team_goals
  has_many :user_teams
  has_many :users, through: :user_teams
end
