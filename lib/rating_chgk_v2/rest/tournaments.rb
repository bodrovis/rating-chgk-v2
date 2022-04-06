# frozen_string_literal: true

module RatingChgkV2
  module Rest
    module Tournaments
      def tournaments(params = {})
        collection_load name: 'Tournaments', ep_params: [[], params]
      end

      def tournament(id)
        model_load name: 'Tournament', ep_name: 'Tournaments', ep_params: id
      end

      def tournament_appeals(id)
        collection_load name: 'TournamentAppeals', ep_name: 'Tournaments', ep_params: [[id, :appeals]]
      end

      def tournament_requests(id)
        collection_load name: 'TournamentRequests', ep_name: 'Tournaments', ep_params: [[id, :requests]]
      end

      def tournament_results(id, params = {})
        collection_load name: 'TournamentResults', ep_name: 'Tournaments', ep_params: [[id, :results], params]
      end
    end
  end
end
