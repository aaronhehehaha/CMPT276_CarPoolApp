class AddTimeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :testtime, :time
  end
end
