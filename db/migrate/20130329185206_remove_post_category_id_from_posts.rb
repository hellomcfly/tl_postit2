class RemovePostCategoryIdFromPosts < ActiveRecord::Migration
  def up
    remove_column :posts, :post_category_ID
  end

  def down
    add_column :posts, :post_category_ID, :integer
  end
end
