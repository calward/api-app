class ActivityFeedController < ApplicationController
  def index
    respond do
      render json: { feed: activity_feed[offset, PAGE_SIZE] }, status: :ok
    end
  end

  private

  def activity_feed
    feed = Post.all + Comment.all
    feed.sort_by { |object| object.timestamp }.reverse!
  end
end
