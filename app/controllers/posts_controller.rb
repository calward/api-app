class PostsController < ApplicationController

  # Posts show

  # Path: /posts/:id
  # @param [id](Integer)(required) Id of the post
  # @return JSON schema:
  # { id: Integer
  #   title: String
  #   body: String
  #   posted_at: DateTime
  #   user_name: String
  #   user_rating: Float
  #   four_starred_at: Timestamp
  # }

  def show
    respond do
      post = Post.find(params.require(:id))

      render json: { id: post.id, title: post.title, body: post.body, posted_at: post.posted_at,
      user_name: post.user.name, user_rating: post.user.rating, four_starred_at: post.four_starred_at  }, status: :ok
    end
  end

  # Posts create

  # Path: /posts
  # @param [title](String)(required) Title of the post
  # @param [body](String)(required) Body of the post
  # @param [user_id](Integer)(required) User id the post belongs to
  # @return JSON schema:
  # { id: post ID (Integer) }
  def create
    respond do
      title, body, user_id = params.require(%i[title body user_id])
      post = Post.create!(title:, body:, user_id:, posted_at: Time.current)

      render json: { id: post.id }, status: :created
    end
  end
end
