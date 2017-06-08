class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      
      t.string :title
      t.string :writer
      t.string :content
      t.integer :view
      

      t.timestamps null: false
    end
  end
end
