# frozen_string_literal: true

module RatingChgkV2
  module Rest
    module AuthenticationToken
      def authentication_token(params)
        RatingChgkV2::Models::AuthenticationTokenModel.load :do_post, token_endpoint([], params)
      end

      private

      def token_endpoint(query, params = {})
        RatingChgkV2::Endpoints::AuthenticationTokenEndpoint.new self, query, params
      end
    end
  end
end
