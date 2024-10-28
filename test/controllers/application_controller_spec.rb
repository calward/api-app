require 'rails_helper'

RSpec.describe ApplicationController, type: :request do
  it 'throws 401 when no api key provided' do
    post '/ratings', params: { user_id: 1, rater_id: 2, rating: 3 }

    expect(response.status).to eq(401)
    expect(response.parsed_body[:data]).to eq('No valid API key provided')
  end

  it 'throws 401 when invalid API key provided' do
    headers = { 'HTTP_AUTHORIZATION' => 'Bearer Foo' }
    post '/ratings', params: { user_id: 1, rater_id: 2, rating: 3, headers: }

    expect(response.status).to eq(401)
    expect(response.parsed_body[:data]).to eq('No valid API key provided')
  end

  context 'when valid API key exists' do
    it 'does not throws 401 when valid API key provided' do
      post('/ratings', params: { user_id: 1, rater_id: 2, rating: 3 }, headers:)

      expect(response.status).to_not eq(401)
    end
  end
end
