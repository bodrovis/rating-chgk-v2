# frozen_string_literal: true

module RatingChgkV2
  module Endpoints
    class TournamentsEndpoint < BaseEndpoint
      private

      def base_query
        [:tournaments]
      end
    end
  end
end
