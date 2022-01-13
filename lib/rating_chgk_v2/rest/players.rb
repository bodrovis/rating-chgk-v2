# frozen_string_literal: true

require_relative '../collections/players_collection'
require_relative '../endpoints/players_endpoint'

module RatingChgkV2
  module Rest
    module Players
      def players(params = {})
        endpoint = RatingChgkV2::Endpoints::PlayersEndpoint.new(self, :players, params)
        RatingChgkV2::Collections::PlayersCollection.new endpoint, endpoint.do_get
      end

      def player(id)
        RatingChgkV2::Endpoints::PlayersEndpoint.new self, [:players, id]
        # get "players/#{id}"
      end

      def player_seasons(id, params = {})
        get "players/#{id}/seasons", params
      end

      def player_tournaments(id, params = {})
        get "players/#{id}/tournaments", params
      end
    end
  end
end
