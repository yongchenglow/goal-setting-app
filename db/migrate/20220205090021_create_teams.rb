class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.references :organization, null: false, foreign_key: true, index: true
      t.references :created_by, null: false, foreign_key: {to_table: :users}, index: true
      t.references :updated_by, null: false, foreign_key: {to_table: :users}, index: true
      t.timestamps
    end
    add_index :teams, [:name, :organization_id], unique: true
  end
end
