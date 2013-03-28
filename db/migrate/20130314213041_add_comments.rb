class AddComments < ActiveRecord::Migration
  def up
  	create_table :comments do |t|
  		t.text :body
  		t.integer :user_id, :post_id

  		t.timestamps
  	end
  end

  def down
  end
end
