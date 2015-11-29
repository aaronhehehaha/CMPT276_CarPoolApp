class ChangeTimesFromPosts < ActiveRecord::Migration
  def change
    change_column :posts, :MonStartTime, :integer
    change_column :posts, :MonEndTime, :integer
    change_column :posts, :TueStartTime, :integer
    change_column :posts, :TueEndTime, :integer
    change_column :posts, :WenStartTime, :integer
    change_column :posts, :ThuStartTime, :integer
    change_column :posts, :ThuEndTime, :integer
    change_column :posts, :FriStartTime, :integer
    change_column :posts, :FriEndTime, :integer
    add_column :posts, :WenEndTime, :integer
  end
end
