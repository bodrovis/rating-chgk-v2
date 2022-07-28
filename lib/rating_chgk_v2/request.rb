# frozen_string_literal: true

module RatingChgkV2
  module Request
    include RatingChgkV2::Connection
    include RatingChgkV2::JsonHandler

    def get(path, client, params = {})
      respond_with(
        connection(client).get(prepare(path), params),
        client
      )
    end

    def post(path, client, params = {})
      respond_with(
        connection(client).post(prepare(path), custom_dump(params)),
        client
      )
    end

    def put(path, client, params = {})
      respond_with(
        connection(client).put(prepare(path), custom_dump(params)),
        client
      )
    end

    def delete(path, client, _params = {})
      respond_with(
        connection(client).delete(prepare(path)),
        client
      )
    end

    private

    # Get rid of double slashes in the `path`, leading and trailing slash
    def prepare(path)
      path.delete_prefix('/').gsub(%r{//}, '/').gsub(%r{/+\z}, '')
    end

    def respond_with(response, _client)
      body = response.body.empty? ? response.body : custom_load(response.body)
      status = response.status
      respond_with_error status, body if status.between?(400, 599)

      body
    end

    def respond_with_error(code, body)
      raise(RatingChgkV2::Error, body) unless RatingChgkV2::Error::ERRORS.key? code

      raise RatingChgkV2::Error::ERRORS[code].from_response(body)
    end
  end
end
