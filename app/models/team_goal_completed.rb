class TeamGoalCompleted < ApplicationRecord
  belongs_to :team_goal
  belongs_to :completed_by, class_name: 'User'
end
