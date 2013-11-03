class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.datetime :published_at
      t.boolean :published
      t.text :body
    end
  end
end
