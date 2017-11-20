class User < ApplicationRecord
  has_many :posts, :comments, dependent: :destroy
  validates :username, presence: true
end
