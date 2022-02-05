class CreateUserOrganizations < ActiveRecord::Migration[6.1]
  def change
    create_table :user_organizations do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.references :organization, null: false, foreign_key: true, index: true
      t.references :created_by, null: false, foreign_key: {to_table: :users}, index: true
      t.datetime :created_at, null: false
    end
  end
end
