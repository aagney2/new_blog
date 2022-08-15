class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :commentor
      t.text :description
      t.bigint :blog_id
      t.timestamps
    end
  end
end
