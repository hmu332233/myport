class CreateDownloadFiles < ActiveRecord::Migration
  def change
    create_table :download_files do |t|
      t.integer :post_id
      t.string :url

      t.timestamps null: false
    end
  end
end
