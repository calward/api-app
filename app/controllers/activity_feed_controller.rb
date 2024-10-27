class ActivityFeedController < ApplicationController
  # Activity feed index

  # Path: /activity_feed
  # @param [user_id](Integer)(required) User ID for the feed being viewed

  # @return JSON schema:
  # { Comment || Post || Github activity }
  # Comment Entity:
  #
  # {
  #   comments: [{
  #     id: Integer,
  #     message: String,
  #     user_id: Integer,
  #     post_id: Integer
  #     commented_at: Timestamp
  #     created_at: Timestamp
  #     updated_at: Timestamp
  #   ]}
  # }
  # Post Entity:
  #   # { id: Integer,
  #   title: String,
  #   body: String,
  #   posted_at: DateTime,
  #   user_name: String,
  #   user_rating: Float,
  #   four_starred_at: Timestamp
  # }
  #
  # Github activity: (see github docs)

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
