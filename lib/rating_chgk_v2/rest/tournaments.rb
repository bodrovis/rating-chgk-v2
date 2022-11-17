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

      def create_tournament_result(id, params)
        model_load name: 'TournamentResult', ep_name: 'Tournaments', ep_params: [[id, :results], params],
                   method: :do_post
      end

      def update_tournament_result(id, params)
        model_load name: 'TournamentResult', ep_name: 'Tournaments', ep_params: [[id, :results], params],
                   method: :do_put
      end

      def delete_tournament_result(id)
        endpoint('Tournaments', [id, :results]).do_delete
      end
    end
  end
end
