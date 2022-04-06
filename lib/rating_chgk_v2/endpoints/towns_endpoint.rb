# frozen_string_literal: true

module RatingChgkV2
  module Endpoints
    class TownsEndpoint < BaseEndpoint
      private

      def base_query
        [:towns]
      end
    end
  end
end
