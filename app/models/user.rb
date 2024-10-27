class User < ApplicationRecord
  has_many :ratings
  has_many :posts
  has_many :comments

  def rating
    return 0 unless ratings.any?
    ratings.sum(:rating).to_f / ratings.count.to_f
  end

  def four_star_rating
    posts.where.not(four_starred_at: nil).first
  end
end
