# frozen_string_literal: true

module RatingChgkV2
  module Endpoints
    class BaseEndpoint
      include RatingChgkV2::Request

      attr_reader :params

      HTTP_METHODS = %i[get post put delete patch].freeze

      def initialize(client, query_params = [], params = {})
        @instance_query = base_query.push(*query_params)
        setup client, @instance_query, params
      end

      def reinitialize(new_params: {}, add_query: [])
        add_query = [add_query] unless add_query.is_a?(Array)
        new_query = add_query&.any? ? @instance_query + add_query : @query_params
        setup @client, new_query, new_params
        self
      end

      # Creates methods like `do_post`, `do_get` that proxy calls to the
      # corresponding methods in the `Request` module
      HTTP_METHODS.each do |method_postfix|
        define_method "do_#{method_postfix}" do
          send method_postfix, @uri, @client, @params
        end
      end

      private

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
