# frozen_string_literal: true

module RatingChgkV2
  module Models
    class TournamentModel < BaseModel
      def appeals
        endpoint.reinitialize add_query: :appeals
        RatingChgkV2::Collections::TournamentAppealsCollection.load :do_get, endpoint
      end

      def requests
        endpoint.reinitialize add_query: :requests
        RatingChgkV2::Collections::TournamentRequestsCollection.load :do_get, endpoint
      end

      def results(params = {})
        endpoint.reinitialize new_params: params, add_query: :results
        RatingChgkV2::Collections::TournamentResultsCollection.load :do_get, endpoint
      end
    end
  end
end
