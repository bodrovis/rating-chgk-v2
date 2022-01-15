# frozen_string_literal: true

require_relative '../models/player_model'

module RatingChgkV2
  module Collections
    class PlayersCollection
      attr_reader :items

      MODEL = 'Player'

      def initialize(endpoint, raw_data)
        setup endpoint, raw_data
      end

      def [](index)
        @items[index]
      end

      def next_page!
        @endpoint.reinitialize page: (@endpoint.params[:page] + 1)
        setup @endpoint, @endpoint.do_get
      end

      private

      def setup(endpoint, raw_data)
        @endpoint = endpoint
        @items = produce_models_from raw_data
      end

      def produce_models_from(raw_data)
        return if raw_data.nil?

        model_klass = RatingChgkV2::Models.const_get "#{MODEL}Model"
        raw_data.map do |item|
          model_klass.new item
        end
      end
    end
  end
end
