# frozen_string_literal: true

module RatingChgkV2
  module Endpoints
    class TournamentSynchRequestsEndpoint < BaseEndpoint
      private

      def base_query
        [:tournament_synch_requests]
      end
    end
  end
end
