class ActivityFeedController < ApplicationController
  def index
    respond do
      user = User.find(params.require(:user_id))
      render json: { feed: activity_feed(user)[offset, PAGE_SIZE] }, status: :ok
    end
  end

  private

  def github_events(user)
    JSON.parse(RestClient.get("https://api.github.com/users/#{user.github_username}/events"))
  end

  def activity_feed(user)
    feed = user.posts + user.comments + github_events(user)
    feed.sort_by { |object| sort_method(object) }.reverse!
  end

  def sort_method(object)
    object.respond_to?(:timestamp) ? object.timestamp : object.dig('created_at')
  end
end
