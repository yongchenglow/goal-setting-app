class Goal < ApplicationRecord
  belongs_to :created_by, class_name: 'User'
  has_one :completed, class_name: 'GoalCompleted'
end
