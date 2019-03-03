class CreateMicroPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :micro_posts do |t|
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :micro_posts, [:user_id, :created_at]
  end
end
