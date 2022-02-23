# frozen_string_literal: true

module RatingChgkV2
  module Rest
    module TournamentSynchRequests
      def tournament_synch_request(id)
        model_load name: 'TournamentSynchRequest', ep_name: 'TournamentSynchRequests', ep_params: id
      end
    end
  end
end
