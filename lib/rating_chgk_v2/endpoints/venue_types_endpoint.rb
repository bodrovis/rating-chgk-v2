# frozen_string_literal: true

module RatingChgkV2
  module Endpoints
    class VenueTypesEndpoint < BaseEndpoint
      private

      def base_query
        [:venue_types]
      end
    end
  end
end
