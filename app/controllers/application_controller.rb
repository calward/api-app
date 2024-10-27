class ApplicationController < ActionController::API
  before_action :authenticate

  def authenticate
    api_key = request.headers['HTTP_AUTHORIZATION']&.gsub('Bearer ', '')
    valid_key = APIKey.find_by(value: api_key)
    return if valid_key

    render json: { data: 'No valid API key provided' }, status: :unauthorized
  end

  def respond
    yield
  rescue ActiveRecord::RecordNotFound
    render json: {}, status: :not_found
  rescue ActionController::ParameterMissing
    render json: {}, status: :bad_request
  rescue StandardError => e
    render json: { message: e }, status: :unprocessable_entity
  end
end
