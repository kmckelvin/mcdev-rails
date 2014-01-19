class CreatePresentations < ActiveRecord::Migration
  def change
    create_table :presentations do |t|
      t.string :title
      t.date :presented_on
      t.string :event
      t.string :video_url
      t.string :slides_url

      t.timestamps
    end
  end
end
