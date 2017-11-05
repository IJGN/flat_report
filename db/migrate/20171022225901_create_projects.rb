class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.references :team, foreign_key: true, null: false
      t.string :client_name, null: false
      t.string :project_name, null: false
      t.integer :status, default: 0, null: false
      t.text :description
      t.integer :scheduled_time
      t.integer :actual_time

      t.timestamps
    end
  end
end
