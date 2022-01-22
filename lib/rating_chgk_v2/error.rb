# frozen_string_literal: true

module RatingChgkV2
  class Error < StandardError
    ClientError = Class.new(self)
    ServerError = Class.new(self)

    BadRequest = Class.new(ClientError)
    Unauthorized = Class.new(ClientError)
    NotAcceptable = Class.new(ClientError)
    NotFound = Class.new(ClientError)
    Conflict = Class.new(ClientError)
    TooManyRequests = Class.new(ClientError)
    Forbidden = Class.new(ClientError)
    Locked = Class.new(ClientError)
    MethodNotAllowed = Class.new(ClientError)

    NotImplemented = Class.new(ServerError)
    BadGateway = Class.new(ServerError)
    ServiceUnavailable = Class.new(ServerError)
    GatewayTimeout = Class.new(ServerError)

    ERRORS = {
      400 => RatingChgkV2::Error::BadRequest,
      401 => RatingChgkV2::Error::Unauthorized,
      403 => RatingChgkV2::Error::Forbidden,
      404 => RatingChgkV2::Error::NotFound,
      405 => RatingChgkV2::Error::MethodNotAllowed,
      406 => RatingChgkV2::Error::NotAcceptable,
      409 => RatingChgkV2::Error::Conflict,
      423 => RatingChgkV2::Error::Locked,
      429 => RatingChgkV2::Error::TooManyRequests,
      500 => RatingChgkV2::Error::ServerError,
      502 => RatingChgkV2::Error::BadGateway,
      503 => RatingChgkV2::Error::ServiceUnavailable,
      504 => RatingChgkV2::Error::GatewayTimeout
    }.freeze

    class << self
      # Create a new error from an HTTP response
      def from_response(body)
        msg = body['detail'] || body['message']
        new msg.to_s
      end
    end

    # Initializes a new Error object
    def initialize(message = '')
      super(message)
    end
  end
end
