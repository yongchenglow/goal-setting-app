class CreateTeamGoalCompleteds < ActiveRecord::Migration[6.1]
  def change
    create_table :team_goal_completeds do |t|
      t.references :team_goal, null: false, foreign_key: true, index: true
      t.references :completed_by, null: false, foreign_key: {to_table: :users}, index: true
      t.datetime :created_at, null: false
    end
  end
end
