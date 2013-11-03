class AddProcessedBodyToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :processed_body, :text
  end
end
