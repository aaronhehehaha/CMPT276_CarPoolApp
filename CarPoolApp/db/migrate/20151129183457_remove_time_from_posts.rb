class RemoveTimeFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :testtime, :time
  end
end
