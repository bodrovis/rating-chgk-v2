# frozen_string_literal: true

module RatingChgkV2
  module Rest
    module Venues
      def venues(params = {})
        collection_load name: 'Venues', ep_params: [[], params]
      end

      def venue(id)
        model_load name: 'Venue', ep_name: 'Venues', ep_params: id
      end

      def create_venue(params)
        model_load name: 'Venue', ep_name: 'Venues', ep_params: [[], params], method: :do_post
      end

      def update_venue(id, params)
        model_load name: 'Venue', ep_name: 'Venues', ep_params: [id, params], method: :do_patch
      end

      def delete_venue(id)
        endpoint('Venues', id).do_delete
      end
    end
  end
end
