class User < ApplicationRecord
  has_many :ratings
  has_many :posts
  has_many :comments

  def rating
    ratings.sum(:rating).to_f / ratings.count.to_f
  end
end
