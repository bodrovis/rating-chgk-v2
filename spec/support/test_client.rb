# frozen_string_literal: true

module TestClient
  def test_client(token = nil, params = {})
    RatingChgkV2.client(token: (token || ENV['API_TOKEN']), params: params)
  end
end
