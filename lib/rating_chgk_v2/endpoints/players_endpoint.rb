require "addressable/template"

require_relative '../request'

module RatingChgkV2
  module Endpoints
    class PlayersEndpoint
      include RatingChgkV2::Request

      def initialize(client, query_params = [], params = {})
        query_params = [query_params] unless query_params.is_a?(Array)
        @uri = partial_uri(query_params)

        @client = client
        @params = params
      end

      def call
        get @uri, @client, @params
      end

      private

      def partial_uri(raw_mapping)
        template = Addressable::Template.new '{/segments*}'
        template.expand(
          segments: raw_mapping.to_a.flatten
        ).to_s
      end
    end
  end
end