class User < ApplicationRecord
  has_many :ratings

  def rating
    ratings.sum(:rating).to_f / ratings.count.to_f
  end
end
