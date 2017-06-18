class CreatePostComments < ActiveRecord::Migration
  def change
    create_table :post_comments do |t|
      t.string :user_name
      t.string :content
      t.integer :post_id

      t.timestamps null: false
    end
  end
end
