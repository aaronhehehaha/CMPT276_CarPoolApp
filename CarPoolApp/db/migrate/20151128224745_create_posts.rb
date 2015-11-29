class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :StreetNumber
      t.string :StreetName
      t.boolean :Mon
      t.integer :MonStartTime
      t.integer :MonEndTime
      t.boolean :Tue
      t.integer :TueStartTime
      t.integer :TueEndTime
      t.boolean :Wen
      t.integer :WenStartTime
      t.integer :MonEndTime
      t.boolean :Thu
      t.integer :ThuStartTime
      t.integer :ThuEndTime
      t.boolean :Fri
      t.integer :FriStartTime
      t.integer :FriEndTime
      t.text :Content
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :posts,[:user_id,:created_at]
  end
end
