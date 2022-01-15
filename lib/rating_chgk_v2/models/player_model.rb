# frozen_string_literal: true

module RatingChgkV2
  module Models
    class PlayerModel < BaseModel
      def seasons(params = {})
        endpoint.reinitialize new_params: params, add_query: :seasons
        RatingChgkV2::Collections::PlayerSeasonsCollection.load :do_get, endpoint
      end

      def tournaments(params = {})
        endpoint.reinitialize new_params: params, add_query: :tournaments
        RatingChgkV2::Collections::PlayerTournamentsCollection.load :do_get, endpoint
      end
    end
  end
end
