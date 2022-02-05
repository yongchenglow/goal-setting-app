class GoalCompleted < ApplicationRecord
  belongs_to :goal
  belongs_to :completed_by, class_name: 'User'
end
