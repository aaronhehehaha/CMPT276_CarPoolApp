class RemoveStreetFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :StreetNumber, :integer
    remove_column :posts, :StreetName, :string
  end
end
