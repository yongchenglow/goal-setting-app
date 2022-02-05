class UserGoal < ApplicationRecord
  belongs_to :created_by, class_name: 'User'
  belongs_to :updated_by, class_name: 'User'
  has_one :completed, class_name: 'UserGoalCompleted'
end
