# frozen_string_literal: true

module RatingChgkV2
  module Endpoints
    class TournamentFlagsEndpoint < BaseEndpoint
      private

      def base_query
        [:tournament_flags]
      end
    end
  end
end
