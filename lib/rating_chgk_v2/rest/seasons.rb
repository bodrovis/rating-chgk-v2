# frozen_string_literal: true

module RatingChgkV2
  module Rest
    module Seasons
      def seasons
        collection_load name: 'Seasons', ep_params: [[]]
      end

      def season(id)
        model_load name: 'Season', ep_name: 'Seasons', ep_params: id
      end

      def create_season(params)
        model_load name: 'Season', ep_name: 'Seasons', ep_params: [[], params], method: :do_post
      end

      def update_season(id, params)
        model_load name: 'Season', ep_name: 'Seasons', ep_params: [id, params], method: :do_patch
      end

      def delete_season(id)
        endpoint('Seasons', id).do_delete
      end
    end
  end
end
