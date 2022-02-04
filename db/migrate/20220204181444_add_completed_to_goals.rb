class AddCompletedToGoals < ActiveRecord::Migration[6.1]
  def change
    add_reference :goals, :completed, null: true, foreign_key: {to_table: :goal_completeds}, index: true
  end
end
