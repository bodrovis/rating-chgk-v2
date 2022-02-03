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
    end
  end
end
