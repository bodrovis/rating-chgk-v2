# frozen_string_literal: true

module RatingChgkV2
  module Endpoints
    class TournamentSynchAppealsEndpoint < BaseEndpoint
      private

      def base_query
        [:tournament_synch_appeals]
      end
    end
  end
end
