class CreatePostDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :post_details do |t|
      t.references :post, foreign_key: true, null: false
      t.references :project, foreign_key: true, null: false
      t.integer :spent_time, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
