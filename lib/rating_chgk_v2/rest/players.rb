# frozen_string_literal: true

module RatingChgkV2
  module Rest
    module Players
      def players(params = {})
        ep = endpoint :players, params
        RatingChgkV2::Collections::PlayersCollection.new ep.do_get, ep
      end

      def player(id)
        ep = endpoint [:players, id]
        RatingChgkV2::Models::PlayerModel.new ep.do_get, ep
      end

      def player_seasons(id, params = {})
        ep = endpoint [:players, id, :seasons], params
        RatingChgkV2::Collections::PlayerSeasonsCollection.new ep.do_get, ep
      end

      def player_tournaments(id, params = {})
        ep = endpoint [:players, id, :tournaments], params
        RatingChgkV2::Collections::PlayerTournamentsCollection.new ep.do_get, ep
      end

      private

      def endpoint(query, params = {})
        RatingChgkV2::Endpoints::PlayersEndpoint.new self, query, params
      end
    end
  end
end
