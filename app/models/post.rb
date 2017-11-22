class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, :title, presence: true
  has_and_belongs_to_many :comments
end
