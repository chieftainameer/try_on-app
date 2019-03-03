class AddPictureToMicroPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :micro_posts, :picture, :string
  end
end
