class RemoveWeekdaysFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :Mon, :boolean
    remove_column :posts, :Tue, :boolean
    remove_column :posts, :Wen, :boolean
    remove_column :posts, :Thu, :boolean
    remove_column :posts, :Fri, :boolean
  end
end
