# frozen_string_literal: true

module RatingChgkV2
  module Endpoints
    class CountriesEndpoint < BaseEndpoint
      private

      def base_query
        [:countries]
      end
    end
  end
end
