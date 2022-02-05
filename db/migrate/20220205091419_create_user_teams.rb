class CreateUserTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :user_teams do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.references :team, null: false, foreign_key: true, index: true
      t.references :created_by, null: false, foreign_key: {to_table: :users}, index: true
      t.datetime :created_at, null: false
    end
  end
end
