# frozen_string_literal: true

module RatingChgkV2
  module Endpoints
    class VenuesEndpoint < BaseEndpoint
      private

      def base_query
        [:venues]
      end
    end
  end
end
