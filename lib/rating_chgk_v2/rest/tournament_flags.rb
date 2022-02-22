# frozen_string_literal: true

module RatingChgkV2
  module Rest
    module TournamentFlags
      def tournament_flags
        collection_load name: 'TournamentFlags', ep_params: [[]]
      end

      def tournament_flag(id)
        model_load name: 'TournamentFlag', ep_name: 'TournamentFlags', ep_params: id
      end
    end
  end
end
