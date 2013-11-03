class IndexPostsOnPublishedAtAndPublished < ActiveRecord::Migration
  def change
    add_index :posts, :published_at
    add_index :posts, :published
  end
end
