class CreateGcPosts < ActiveRecord::Migration
  def change
    create_table :gc_posts do |t|
      t.string :nickname
      t.text :image
      t.text :image_preview
      t.text :text

      t.timestamps
    end
  end
end
