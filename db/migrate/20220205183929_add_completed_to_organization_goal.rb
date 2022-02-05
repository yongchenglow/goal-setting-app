class AddCompletedToOrganizationGoal < ActiveRecord::Migration[6.1]
  def change
    add_reference :organization_goals, :completed, null: true, foreign_key: {to_table: :organization_goal_completeds}, index: true
  end
end
