class AddMapToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :Latitude, :float
    add_column :posts, :Longitude, :float
  end
end
