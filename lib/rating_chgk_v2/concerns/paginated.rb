# frozen_string_literal: true

module RatingChgkV2
  module Concerns
    module Paginated
      def next_page!
        page_num = current_page + 1
        params = endpoint.params.merge({page: page_num})
        endpoint.reinitialize new_params: params
        setup endpoint.do_get, endpoint
        self
      end

      def prev_page!
        return if current_page <= 1

        page_num = current_page - 1
        params = endpoint.params.merge({page: page_num})
        endpoint.reinitialize new_params: params
        setup endpoint.do_get, endpoint
        self
      end

      private

      def current_page
        endpoint.params[:page] || 1
      end
    end
  end
end
