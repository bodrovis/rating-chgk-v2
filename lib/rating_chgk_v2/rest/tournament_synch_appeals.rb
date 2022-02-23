# frozen_string_literal: true

module RatingChgkV2
  module Rest
    module TournamentSynchAppeals
      def tournament_synch_appeal(id)
        model_load name: 'TournamentSynchAppeal', ep_name: 'TournamentSynchAppeals', ep_params: id
      end
    end
  end
end
