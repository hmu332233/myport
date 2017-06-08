class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      
      t.string :title
      t.string :writer
      t.string :content
      t.integer :view
      
      #외래키
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
