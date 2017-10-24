class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true, null: false
      t.datetime :published_at, null: false
      t.text :unknown_content
      t.text :impression_content
      t.integer :status, default: 0, null: false
      t.integer :stars_count, default: 0, null: false

      t.timestamps null: false
    end
  end
end
