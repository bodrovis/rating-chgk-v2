# frozen_string_literal: true

module RatingChgkV2
  module Endpoints
    class TournamentTypesEndpoint < BaseEndpoint
      private

      def base_query
        [:tournament_types]
      end
    end
  end
end
