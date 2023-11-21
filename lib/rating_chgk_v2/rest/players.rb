# frozen_string_literal: true

module RatingChgkV2
  module Rest
    module Players
      def players(params = {})
        collection_load name: 'Players', ep_params: [[], params]
      end

      def player(id)
        model_load name: 'Player', ep_name: 'Players', ep_params: id
      end

      def player_seasons(id, params = {})
        collection_load name: 'PlayerSeasons', ep_name: 'Players', ep_params: [[id, :seasons], params]
      end

      def player_tournaments(id, params = {})
        collection_load name: 'PlayerTournaments', ep_name: 'Players', ep_params: [[id, :tournaments], params]
      end

      def create_player(params)
        model_load name: 'Player', ep_name: 'Players', ep_params: [[], params], method: :do_post
      end

      def update_player(id, params)
        model_load name: 'Player', ep_name: 'Players', ep_params: [id, params], method: :do_patch
      end

      def delete_player(id)
        endpoint('Players', id).do_delete
      end
    end
  end
end
