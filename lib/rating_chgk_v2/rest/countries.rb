# frozen_string_literal: true

module RatingChgkV2
  module Rest
    module Countries
      def countries(params = {})
        collection_load name: 'Countries', ep_params: [[], params]
      end

      def country(id)
        model_load name: 'Country', ep_name: 'Countries', ep_params: id
      end

      def create_country(params)
        model_load name: 'Country', ep_name: 'Countries', ep_params: [[], params], method: :do_post
      end

      def update_country(id, params)
        model_load name: 'Country', ep_name: 'Countries', ep_params: [id, params], method: :do_patch
      end

      def delete_country(id)
        endpoint('Countries', id).do_delete
      end
    end
  end
end
