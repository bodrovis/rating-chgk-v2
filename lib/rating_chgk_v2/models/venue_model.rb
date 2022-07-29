# frozen_string_literal: true

module RatingChgkV2
  module Models
    class VenueModel < BaseModel
      def update(params = {})
        endpoint.reinitialize new_params: params
        self.class.load :do_put, endpoint
      end

      def destroy
        endpoint.do_delete
      end

      def requests(params = {})
        endpoint.reinitialize new_params: params, add_query: :requests
        RatingChgkV2::Collections::TournamentRequestsCollection.load :do_get, endpoint
      end
    end
  end
end
