class Category < ActiveRecord::Base
	has_many :post_categories
	has_many :posts, through: :post_categories

	validates :title, presence: true, uniqueness: true, length: {minimum: 2, maximum: 10}
end