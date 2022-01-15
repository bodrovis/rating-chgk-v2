# frozen_string_literal: true

module RatingChgkV2
  module Collections
    class BaseCollection
      include Enumerable

      MODEL = ''
      attr_reader :items, :endpoint

      def initialize(raw_data, endpoint)
        setup raw_data, endpoint
      end

      def [](index)
        @items[index]
      end

      def first
        @items[0]
      end

      def each(&block)
        @items.each(&block)
      end

      def next_page!
        page_num = (@endpoint.params[:page] || 1) + 1
        params = @endpoint.params.merge({page: page_num})
        @endpoint.reinitialize new_params: params
        setup @endpoint.do_get, @endpoint
      end

      private

      def setup(raw_data, endpoint)
        @endpoint = endpoint
        @items = produce_models_from raw_data
      end

      def produce_models_from(raw_data)
        return if raw_data.nil?

        model_name = self.class.const_get :MODEL
        model_klass = RatingChgkV2::Models.const_get "#{model_name}Model"
        raw_data.map do |item|
          model_klass.new item
        end
      end
    end
  end
end
