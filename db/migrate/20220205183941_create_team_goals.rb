class CreateTeamGoals < ActiveRecord::Migration[6.1]
  def change
    create_table :team_goals do |t|
      t.string :description, null: false
      t.references :created_by, null: false, foreign_key: {to_table: :users}, index: true
      t.references :updated_by, null: false, foreign_key: {to_table: :users}, index: true
      t.references :team, null: false, foreign_key: true, index: true
      t.timestamps
    end
  end
end
