class RatingsController < ApplicationController
  def create
    respond do
      user_id, rater_id, rating = params.require(%i[user_id rater_id rating])
      rating = Rating.create!(user_id:, rater_id:, rating:, rated_at: Time.current)

      render json: { id: rating.id }, status: :created
    end
  end
end
