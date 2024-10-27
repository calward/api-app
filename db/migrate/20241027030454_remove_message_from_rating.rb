class RemoveMessageFromRating < ActiveRecord::Migration[7.1]
  def change
    remove_column(:ratings, :message)
  end
end
