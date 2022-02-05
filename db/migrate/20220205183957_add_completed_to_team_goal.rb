class AddCompletedToTeamGoal < ActiveRecord::Migration[6.1]
  def change
    add_reference :team_goals, :completed, null: true, foreign_key: {to_table: :team_goal_completeds}, index: true
  end
end
