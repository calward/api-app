require 'rails_helper'

RSpec.describe PostsController, type: :request do
  before do
    allow_any_instance_of(User).to receive(:rating).and_return(3.0)
  end

  it 'throws 404 when no post exists' do
    get('/posts/-1', headers:)

    expect(response.status).to eq(404)
  end

  it 'returns post' do
    get("/posts/#{Post.first.id}", headers:)

    expect(response.status).to eq(200)
    expect(response.parsed_body[:user_name]).to eq(Post.first.user.name)
    expect(response.parsed_body[:user_rating]).to eq(3.0)
  end

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
