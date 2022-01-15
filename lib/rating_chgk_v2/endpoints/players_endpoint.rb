# frozen_string_literal: true

require 'addressable/template'

require_relative '../request'

module RatingChgkV2
  module Endpoints
    class PlayersEndpoint
      include RatingChgkV2::Request

      attr_reader :params

      def initialize(client, query_params = [], params = {})
        setup client, query_params, params
      end

      def reinitialize(new_params)
        setup @client, @query_params, @params.merge(new_params)
        self
      end

      def do_get
        get @uri, @client, @params
      end

      private

      def setup(client, query_params = [], params = {})
        @query_params = query_params.is_a?(Array) ? query_params : [query_params]
        @uri = partial_uri(@query_params)
        @client = client
        @params = params
      end

      def partial_uri(raw_mapping)
        template = Addressable::Template.new '{/segments*}'
        template.expand(
          segments: raw_mapping.to_a.flatten
        ).to_s
      end
    end
  end
end
