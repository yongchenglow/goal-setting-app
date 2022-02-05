class OrganizationGoalCompleted < ApplicationRecord
  belongs_to :organization_goal
  belongs_to :completed_by, class_name: 'User'
end
