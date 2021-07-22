class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :artwork_id
      t.integer :comment_id
      t.integer :liker_id, null: false

      t.bigint :imageable_id
      t.string :imageable_type

      t.timestamps
    end
    add_index :likes, [:imageable_id, :imageable_type]
    add_index :likes, :artwork_id
    add_index :likes, :comment_id
    add_index :likes, :liker_id
  end
end
