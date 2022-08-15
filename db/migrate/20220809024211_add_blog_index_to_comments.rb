class AddBlogIndexToComments < ActiveRecord::Migration[6.1]
  def change
    add_index :comments, :blog_id
  end
end
