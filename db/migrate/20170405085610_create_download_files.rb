class CreateDownloadFiles < ActiveRecord::Migration
  def change
    create_table :download_files do |t|
      t.integer :post_id
      t.string :url
      t.string :name
      
      #명세에 추가안된 부분
      t.string :saved_name

      t.timestamps null: false
    end
  end
end
