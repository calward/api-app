class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  default_scope { order(commented_at: :desc) }
end
