class CreatePost2tags < ActiveRecord::Migration
  def change
    create_table :post2tags do |t|
      
      t.integer :post_id
      t.integer :hash_tag_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
