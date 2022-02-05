class UserGoalCompleted < ApplicationRecord
  belongs_to :user_goal
  belongs_to :completed_by, class_name: 'User'
end
