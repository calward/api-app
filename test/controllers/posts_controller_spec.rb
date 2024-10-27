require 'rails_helper'

RSpec.describe PostsController, type: :request do
  it 'returns 404 when no post found' do
    get('/posts/99', headers:)

    expect(response.status).to eq(404)
  end

  it 'returns post' do
    get("/posts/#{Post.first.id}", headers:)

    expect(response.status).to eq(200)
    expect(response.parsed_body[:id]).to eq(Post.first.id)
    expect(response.parsed_body[:title]).to eq(Post.first.title)
  end
end
