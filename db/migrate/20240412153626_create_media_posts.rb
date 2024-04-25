class CreateMediaPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :media_posts do |t|
      t.string :url
      t.string :title, null: false
      t.integer :genre, null: false
      t.date :date_public, null: false
      t.timestamps
    end
  end
end
