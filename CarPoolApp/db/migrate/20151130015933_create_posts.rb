class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts2 do |t|
      t.string :Address
      t.integer :MonStartTime
      t.integer :MonEndTime
      t.integer :TueStartTime
      t.integer :TueEndTime
      t.integer :WenStartTime
      t.integer :WenEndTime
      t.integer :ThuStartTime
      t.integer :ThuEndTime
      t.integer :FriStartTime
      t.integer :FriEndTime
      t.string :Content
      t.float :longitude
      t.float :latitude
      t.string :destination
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :posts2,[:user_id,:created_at]
  end
end
