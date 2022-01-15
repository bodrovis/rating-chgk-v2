# frozen_string_literal: true

module RatingChgkV2
  module Endpoints
    class PlayersEndpoint < BaseEndpoint
      private

      def base_query
        [:players]
      end
    end
  end
end
