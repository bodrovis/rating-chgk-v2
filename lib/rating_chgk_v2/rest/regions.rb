# frozen_string_literal: true

module RatingChgkV2
  module Rest
    module Regions
      def regions(params = {})
        collection_load name: 'Regions', ep_params: [[], params]
      end

      def region(id)
        model_load name: 'Region', ep_name: 'Regions', ep_params: id
      end
    end
  end
end
