class ChangeMapFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :Longitude, :float
    remove_column :posts, :Latitude, :float
  end
end
