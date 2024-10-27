class ActivityFeedController < ApplicationController
  def index
    respond do
      user = User.find(params.require(:user_id))
      render json: { feed: activity_feed(user)[offset, PAGE_SIZE] }, status: :ok
    end
  end

  private

  def activity_feed(user)
    feed = user.posts + user.comments
    feed.sort_by { |object| object.timestamp }.reverse!
  end
end
