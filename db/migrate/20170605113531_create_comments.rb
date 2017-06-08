class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
  
      t.string :replyname
      t.text :replycontent
      t.integer :board_id

      t.timestamps null: false
    end
  end
end
