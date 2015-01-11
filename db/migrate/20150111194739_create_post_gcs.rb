class CreatePostGcs < ActiveRecord::Migration
  def change
    create_table :post_gcs do |t|
      t.string :username
      t.text :img_url
      t.text :text

      t.timestamps
    end
  end
end
