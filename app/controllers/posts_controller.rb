class PostsController < ApplicationController
  def show
    respond do
      post = Post.find(params.require(:id))

      render json: { id: post.id, title: post.title, body: post.body, posted_at: post.posted_at,
      user_name: post.user.name, user_rating: post.user.rating  }, status: :ok
    end
  end

  def create
    respond do
      title, body, user_id = params.require(%i[title body user_id])
      post = Post.create!(title:, body:, user_id:, posted_at: Time.current)

      render json: { id: post.id }, status: :created
    end
  end
end
