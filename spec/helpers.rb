module Helpers
  def headers
    headers = { 'HTTP_AUTHORIZATION' => "Bearer #{APIKey.first.value}" }
  end
end