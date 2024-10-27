class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :rater, class_name: 'User'

  after_save :create_four_star_post

  default_scope { where('rating >= 4') }

  def timestamp
    rated_at
  end

  def create_four_star_post
    return if user.four_star_rating.present?
    return unless user.rating >= 4

    user.posts.create!(title: '', body: '', four_starred_at: Time.current, posted_at: Time.current)
  end
end
