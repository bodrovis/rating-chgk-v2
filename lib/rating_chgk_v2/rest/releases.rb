# frozen_string_literal: true

module RatingChgkV2
  module Rest
    module Releases
      def releases(params = {})
        collection_load name: 'Releases', ep_params: [[], params]
      end

      def release(id)
        model_load name: 'Release', ep_name: 'Releases', ep_params: id
      end
    end
  end
end
