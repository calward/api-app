class CommentsController < ApplicationController
  def index
    respond do

      comments = Post.find(params.require(:post_id)).comments.offset(offset).limit(PAGE_SIZE)

      render json: { comments: }, status: :ok
    end
  end

  def create
    post_id, user_id, message, = params.require(%i[post_id user_id message])
    post = Post.find(post_id)
    comment = post.comments.create!(user_id:, message:, commented_at: Time.current)

    render json: { id: comment.id }, status: :created
  end
end
