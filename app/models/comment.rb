class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def timestamp
    commented_at
  end
end
