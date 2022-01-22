# frozen_string_literal: true

module RatingChgkV2
  module Rest
    module Regions
      def regions(params = {})
        RatingChgkV2::Collections::RegionsCollection.load :do_get, regions_endpoint([], params)
      end

      def region(id)
        RatingChgkV2::Models::RegionModel.load :do_get, regions_endpoint(id)
      end

      private

      def regions_endpoint(query, params = {})
        RatingChgkV2::Endpoints::RegionsEndpoint.new self, query, params
      end
    end
  end
end
