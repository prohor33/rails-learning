class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :nickname
      t.text :message

      t.timestamps
    end
  end
end
