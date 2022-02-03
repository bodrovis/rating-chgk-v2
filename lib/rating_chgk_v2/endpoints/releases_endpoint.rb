# frozen_string_literal: true

module RatingChgkV2
  module Endpoints
    class ReleasesEndpoint < BaseEndpoint
      private

      def base_query
        [:releases]
      end
    end
  end
end
