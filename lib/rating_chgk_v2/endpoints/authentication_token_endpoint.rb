# frozen_string_literal: true

module RatingChgkV2
  module Endpoints
    class AuthenticationTokenEndpoint < BaseEndpoint
      private

      def base_query
        [:authentication_token]
      end
    end
  end
end
