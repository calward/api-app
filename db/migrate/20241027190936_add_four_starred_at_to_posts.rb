class AddFourStarredAtToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column(:posts, :four_starred_at, :timestamp)
  end
end
