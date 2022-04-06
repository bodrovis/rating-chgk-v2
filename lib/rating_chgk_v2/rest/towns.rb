# frozen_string_literal: true

module RatingChgkV2
  module Rest
    module Towns
      def towns(params = {})
        collection_load name: 'Towns', ep_params: [[], params]
      end

      def town(id)
        model_load name: 'Town', ep_name: 'Towns', ep_params: id
      end
    end
  end
end
