class UserTeam < ApplicationRecord
  belongs_to :user
  belongs_to :team
  belongs_to :created_by, class_name: 'User'
end
