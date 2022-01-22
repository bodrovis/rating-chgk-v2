# frozen_string_literal: true

require 'pry'
module RatingChgkV2
  module Collections
    class BaseCollection
      include Enumerable

      MODEL = ''
      attr_reader :items, :endpoint

      class << self
        def load(method, endpoint)
          new endpoint.send(method), endpoint
        end

        def paginated
          class_eval { include RatingChgkV2::Concerns::Paginated }
        end
      end

      def initialize(raw_data, endpoint = nil)
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

      private

      def setup(raw_data, endpoint)
        @endpoint = endpoint
        @items = produce_models_from raw_data
      end

      def produce_models_from(raw_data)
        return [] if raw_data&.empty?

        model_name = self.class.const_get :MODEL
        model_klass = RatingChgkV2::Models.const_get "#{model_name}Model"
        raw_data.map do |item|
          model_klass.new item
        end
      end
    end
  end
end
