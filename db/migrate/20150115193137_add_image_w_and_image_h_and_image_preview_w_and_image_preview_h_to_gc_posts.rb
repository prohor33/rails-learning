class AddImageWAndImageHAndImagePreviewWAndImagePreviewHToGcPosts < ActiveRecord::Migration
  def change
    add_column :gc_posts, :image_w, :integer
    add_column :gc_posts, :image_h, :integer
    add_column :gc_posts, :image_preview_w, :integer
    add_column :gc_posts, :image_preview_h, :integer
  end
end
