class AddMissingForeignKeys < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :comments, :users
    add_foreign_key :comments, :posts
    add_foreign_key :posts, :users
    add_foreign_key :ratings, :users
  end
end
