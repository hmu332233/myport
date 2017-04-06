class CreateHashTags < ActiveRecord::Migration
  def change
    create_table :hash_tags do |t|
      
      t.string :name
      
      #외래키
      t.integer :post_id

      t.timestamps null: false
    end
  end
end
