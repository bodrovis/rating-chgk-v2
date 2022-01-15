# frozen_string_literal: true

module RatingChgkV2
  module Rest
    module Players
      def players(params = {})
        RatingChgkV2::Collections::PlayersCollection.load :do_get, endpoint([], params)
      end

      def player(id)
        RatingChgkV2::Models::PlayerModel.load :do_get, endpoint(id)
      end

      def player_seasons(id, params = {})
        RatingChgkV2::Collections::PlayerSeasonsCollection.load :do_get, endpoint([id, :seasons], params)
      end

      def player_tournaments(id, params = {})
        RatingChgkV2::Collections::PlayerTournamentsCollection.load :do_get, endpoint([id, :tournaments], params)
      end

      private

      def endpoint(query, params = {})
        RatingChgkV2::Endpoints::PlayersEndpoint.new self, query, params
      end
    end
  end
end
