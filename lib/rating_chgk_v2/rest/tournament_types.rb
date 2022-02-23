# frozen_string_literal: true

module RatingChgkV2
  module Rest
    module TournamentTypes
      def tournament_types
        collection_load name: 'TournamentTypes', ep_params: [[]]
      end

      def tournament_type(id)
        model_load name: 'TournamentType', ep_name: 'TournamentTypes', ep_params: id
      end
    end
  end
end
