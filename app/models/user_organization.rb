class UserOrganization < ApplicationRecord
  belongs_to :user
  belongs_to :organization
  belongs_to :created_by, class_name: 'User'
end
