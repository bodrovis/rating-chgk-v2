# frozen_string_literal: true

module RatingChgkV2
  module Rest
    module VenueTypes
      def venue_types(params = {})
        collection_load name: 'VenueTypes', ep_params: [[], params]
      end

      def venue_type(id)
        model_load name: 'VenueType', ep_name: 'VenueTypes', ep_params: id
      end

      def create_venue_type(params)
        model_load name: 'VenueType', ep_name: 'VenueTypes', ep_params: [[], params], method: :do_post
      end
    end
  end
end
