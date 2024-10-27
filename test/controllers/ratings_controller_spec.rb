require 'rails_helper'

RSpec.describe RatingsController, type: :request do
  it 'throws 400 when given invalid params' do
    post('/ratings', params: { rating: 3 }, headers:)

    expect(response.status).to eq(400)
  end
  it 'throws 422 when user or rater do not exist' do
    post('/ratings', params: { user_id: -1, rater_id: -1, rating: 3 }, headers:)

    expect(response.status).to eq(422)
  end

  it 'returns rating' do
    post('/ratings', params: { user_id: User.first.id, rater_id: User.second.id, rating: 3 }, headers:)

    expect(response.status).to eq(201)
    expect(response.parsed_body[:id]).to eq(Rating.last.id)
  end
end
