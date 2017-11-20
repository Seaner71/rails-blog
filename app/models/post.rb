class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, :title, presence: true
  has_many :comments
end
