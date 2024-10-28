require 'rails_helper'

RSpec.describe CommentsController, type: :request do
  describe 'create' do
    it 'throws 404 when given post that does not exist' do
      post('/posts/-1/comments', params: { post_id: -1, message: 'Delete this', user_id: User.first.id }, headers:)

      expect(response.status).to eq(404)
    end
    it 'throws 422 when given user that does not exist' do
      post("/posts/#{Post.first.id}/comments", params: { post_id: Post.first.id, message: 'Delete this', user_id: -1 },
                                              headers:)

      expect(response.status).to eq(422)
    end

    it 'returns comment' do
      post("/posts/#{Post.first.id}/comments",
          params: { post_id: Post.first.id, message: 'Delete this', user_id: User.first.id }, headers:)

      expect(response.status).to eq(201)
      expect(response.parsed_body[:id]).to eq(Comment.unscoped.last.id)
    end
  end

  describe 'index' do
     it 'throws 404 when given post that does not exist' do
      get('/posts/-1/comments', params: { post_id: -1, message: 'Delete this', user_id: User.first.id }, headers:)

      expect(response.status).to eq(404)
    end

    it 'returns comments' do
      post = Post.first
      get("/posts/#{post.id}/comments", headers:)

      expect(response.status).to eq(200)
      expect(post.comments.count > 25).to eq(true)
      expect(response.parsed_body[:comments].size).to eq(25)
      expect(response.parsed_body[:comments].first[:id]).to eq(post.comments.first.id)
      expect(response.parsed_body[:comments].first[:user_rating]).to be_present
      expect(response.parsed_body[:comments].first[:user_name]).to be_present
    end

    it 'returns first page when given page 1' do
      post = Post.first
      get("/posts/#{post.id}/comments", params: { page: 1 }, headers:)


      expect(response.status).to eq(200)

      expect(response.parsed_body[:comments].size).to eq(25)
      expect(response.parsed_body[:comments].first[:id]).to eq(post.comments.first.id)
    end

    it 'returns 2nd page of comments when given page 2' do
      post = Post.first
      get("/posts/#{post.id}/comments", params: { page: 2 }, headers:)


      expect(response.status).to eq(200)

      expect(response.parsed_body[:comments].size).to eq(25)
      expect(response.parsed_body[:comments].first[:id]).to eq(post.comments.offset(25).first.id)
    end
  end
end
