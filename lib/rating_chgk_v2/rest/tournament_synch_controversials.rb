# frozen_string_literal: true

module RatingChgkV2
  module Rest
    module TournamentSynchControversials
      def tournament_synch_controversial(id)
        model_load name: 'TournamentSynchControversial', ep_name: 'TournamentSynchControversials', ep_params: id
      end
    end
  end
end
