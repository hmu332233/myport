class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.string :user_name
      t.integer :scope
      
      #외래키
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
