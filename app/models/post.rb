class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  
  has_many :post_categories
  has_many :categories, through: :post_categories

  has_many :votes, as: :voteable

  validates :title, presence: true
  validates :body, presence: true
  validates :url, presence: true

  def net_votes
  	self.votes.where(vote: true).size - self.votes.where(vote: false).size
  end
  
end
