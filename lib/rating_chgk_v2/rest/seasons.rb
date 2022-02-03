# frozen_string_literal: true

module RatingChgkV2
  module Rest
    module Seasons
      def seasons
        collection_load name: 'Seasons', ep_params: [[]]
      end
    end
  end
end
