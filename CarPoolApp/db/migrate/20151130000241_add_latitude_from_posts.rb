class AddLatitudeFromPosts < ActiveRecord::Migration
  def change
    add_column :posts, :latitude, :float
    add_column :posts, :longitude, :float
  end
end
