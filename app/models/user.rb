class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :destroy
  # comments seeding issue - $TODO figure out why comments not generating
  has_many :comments, through: :posts, dependent: :destroy
  validates :username, :password, presence: true
  validates :username, presence: true
  validates :password, length: { in: 6..20 }
  validates :username, uniqueness: true
  validates :username, length: { in: 3..20 }

end
