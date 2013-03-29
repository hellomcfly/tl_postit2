class AddPostCategoryIdToPosts < ActiveRecord::Migration
  def change
  		add_column :posts, :post_category_ID, :integer
  end
end
