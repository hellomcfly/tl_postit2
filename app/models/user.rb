class User < ActiveRecord::Base
  has_secure_password

  has_many :posts
  has_many :comments
  has_many :votes

  validates :name, presence: true, uniqueness: true
  validates :password, presence: true, on: :create
end
