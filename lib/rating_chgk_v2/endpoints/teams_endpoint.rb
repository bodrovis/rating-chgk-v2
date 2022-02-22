# frozen_string_literal: true

module RatingChgkV2
  module Endpoints
    class TeamsEndpoint < BaseEndpoint
      private

      def base_query
        [:teams]
      end
    end
  end
end
