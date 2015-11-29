class Post < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :Address, presence: true, length: { maximum: 50}
  
end
