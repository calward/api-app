class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  def timestamp
    posted_at
  end
end
