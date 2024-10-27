class CommentsController < ApplicationController

  # Comments index

  # Path: /post/:id/comments
  # @param [post_id](Integer)(required) Post ID of the post receiving the comment

  # @return JSON schema:
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
  def index
    respond do

      comments = Post.find(params.require(:post_id)).comments.offset(offset).limit(PAGE_SIZE)

      render json: { comments: }, status: :ok
    end
  end

  # Comments create

  # Path: /comments
  # @param [post_id](Integer)(required) Post ID of the post receiving the comment
  # @param [message](String)(required) Rating
  # @param [user_id](Integer)(required) User ID of the user leaving the comment
  # @return JSON schema:
  # { id: comment ID (Integer) }
  def create
    post_id, user_id, message, = params.require(%i[post_id user_id message])
    post = Post.find(post_id)
    comment = post.comments.create!(user_id:, message:, commented_at: Time.current)

    render json: { id: comment.id }, status: :created
  end
end
