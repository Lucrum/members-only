class AddPostsToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :posts
  end
end
