require_relative '../models/player_model'

module RatingChgkV2
  module Collections
    class PlayersCollection
      attr_reader :items

      MODEL = 'Player'

      def initialize(endpoint)
        @endpoint = endpoint
        @items = produce_models_from endpoint.call
      end

      private

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