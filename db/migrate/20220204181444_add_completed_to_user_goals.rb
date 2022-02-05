class AddCompletedToUserGoals < ActiveRecord::Migration[6.1]
  def change
    add_reference :user_goals, :completed, null: true, foreign_key: {to_table: :user_goal_completeds}, index: true
  end
end
