# frozen_string_literal: true

module RatingChgkV2
  module Endpoints
    class BaseEndpoint
      include RatingChgkV2::Request

      attr_reader :params

      def initialize(client, query_params = [], params = {})
        setup client, base_query.push(*query_params), params
      end

      def reinitialize(new_params: {}, add_query: [])
        add_query = [add_query] unless add_query.is_a?(Array)
        new_query = add_query&.any? ? @query_params.push(*add_query) : @query_params
        setup @client, new_query, new_params
        self
      end

      private

      def respond_to_missing?(method, _include_all)
        return true if /\Ado_(.+)\z/.match?(method.to_s)

        super
      end

      def method_missing(method, *_args)
        if method.to_s =~ /\Ado_(.+)\z/
          send Regexp.last_match(1), @uri, @client, @params
        else
          super
        end
      end

      def setup(client, query_params = [], params = {})
        @query_params = query_params
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

      def base_query
        []
      end
    end
  end
end
