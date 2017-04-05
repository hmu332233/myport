class CreateHashTags < ActiveRecord::Migration
  def change
    create_table :hash_tags do |t|
      t.integer :post_id
      t.string :name

      t.timestamps null: false
    end
  end
end
