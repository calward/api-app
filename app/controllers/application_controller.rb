class ApplicationController < ActionController::API
  before_action :authenticate

  def authenticate
    api_key = request.headers['HTTP_AUTHORIZATION'].gsub('Bearer ', '')
    valid_key = APIKey.find_by(value: api_key)
    unless valid_key
      render json: { data: 'No valid API key provided' }, status: :unauthorized
    end
  end
end
