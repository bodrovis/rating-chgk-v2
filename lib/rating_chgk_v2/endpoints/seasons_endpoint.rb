# frozen_string_literal: true

module RatingChgkV2
  module Endpoints
    class SeasonsEndpoint < BaseEndpoint
      private

      def base_query
        [:seasons]
      end
    end
  end
end
