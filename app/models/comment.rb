class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :post

	has_many :votes, as: :voteable

	validates :body, presence: true

  def net_votes
  	self.votes.where(vote: true).size - self.votes.where(vote: false).size
  end
	
end