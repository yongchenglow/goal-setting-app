class CreateOrganizations < ActiveRecord::Migration[6.1]
  def change
    create_table :organizations do |t|
      t.string :name, null: false
      t.references :created_by, null: false, foreign_key: {to_table: :users}, index: true
      t.references :updated_by, null: false, foreign_key: {to_table: :users}, index: true
      t.timestamps
    end
    add_index :organizations, :name, unique: true
  end
end
