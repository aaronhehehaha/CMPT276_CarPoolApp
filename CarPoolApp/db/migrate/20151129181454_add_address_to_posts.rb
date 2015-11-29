class AddAddressToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :Address, :string
  end
end
