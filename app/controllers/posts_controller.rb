class PostsController < ApplicationController
  def show
    respond do
      post = Post.find(params.require(:id))

      render json: { id: post.id, title: post.title, body: post.body, user_id: post.user_id, posted_at: post.posted_at },
             status: :ok
    end
  end
end
