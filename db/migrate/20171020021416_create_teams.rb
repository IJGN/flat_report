class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.string :access_token

      t.timestamps
    end
    add_index :teams, :name, unique: true
    add_index :teams, :access_token, unique: true
  end
end
