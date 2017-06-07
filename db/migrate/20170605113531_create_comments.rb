class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
  
      t.string :replyname
      t.text :replycontent

      t.timestamps null: false
    end
  end
end
