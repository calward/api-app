require 'rails_helper'

RSpec.describe PostsController, type: :request do
  it 'throws 400 when given invalid params' do
    post('/posts', params: { title: 'title' }, headers:)

    expect(response.status).to eq(400)
  end

  it 'returns post' do
    post('/posts', params: { user_id: User.first.id, title: 'Title', body: 'Body' }, headers:)

    expect(response.status).to eq(201)
    expect(response.parsed_body[:id]).to eq(Post.last.id)
  end
end
