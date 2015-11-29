class ChangeTimeFromPosts < ActiveRecord::Migration
  def change
    change_column :posts, :MonStartTime, :datetime
    change_column :posts, :MonEndTime, :time
    change_column :posts, :TueStartTime, :time
    change_column :posts, :TueEndTime, :time
    change_column :posts, :WenStartTime, :time
    change_column :posts, :ThuStartTime, :time
    change_column :posts, :ThuEndTime, :time
    change_column :posts, :FriStartTime, :time
    change_column :posts, :FriEndTime, :time
  end
end
