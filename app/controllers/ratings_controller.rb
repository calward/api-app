class RatingsController < ApplicationController

  # Ratings create

  # Path: /ratings
  # @param [rater_id](Integer)(required) User ID of the user giving the rating
  # @param [rating](Integer)(required) Rating
  # @param [user_id](Integer)(required) User ID of the user receiving the rating
  # @return JSON schema:
  # { id: rating ID (Integer) }
  def create
    respond do
      user_id, rater_id, rating = params.require(%i[user_id rater_id rating])
      rating = Rating.create!(user_id:, rater_id:, rating:, rated_at: Time.current)

      render json: { id: rating.id }, status: :created
    end
  end
end
