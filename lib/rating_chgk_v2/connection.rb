# frozen_string_literal: true

module RatingChgkV2
  module Connection
    BASE_URL = 'https://api.rating.chgk.net/'

    def connection(client)
      Faraday.new(options(client), request_params_for(client)) do |faraday|
        faraday.adapter Faraday.default_adapter
      end
    end

    private

    def options(client)
      headers = {
        accept: 'application/json',
        user_agent: "rating-chgk-v2 gem/#{RatingChgkV2::VERSION}",
        'Content-Type': 'application/json'
      }

      headers = headers.merge({Authorization: "Bearer #{client.token}"}) unless client.token.to_s.empty?

      {headers: headers, url: BASE_URL}
    end

    # Allows to customize request params per-client
    def request_params_for(client)
      {request: {
        timeout: client.timeout,
        open_timeout: client.open_timeout,
        params_encoder: Faraday::FlatParamsEncoder
      }}
    end
  end
end
