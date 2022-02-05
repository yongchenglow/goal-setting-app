class OrganizationGoal < ApplicationRecord
  belongs_to :created_by, class_name: 'User'
  belongs_to :updated_by, class_name: 'User'
  belongs_to :organization
  has_one :completed, class_name: 'OrganizationGoalCompleted'
end
