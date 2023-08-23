# frozen_string_literal: true

require 'zeitwerk'
require 'yaml'
require 'faraday'
require 'faraday/gzip'
require 'addressable/template'
require 'forwardable'

loader = Zeitwerk::Loader.for_gem
loader.setup

module RatingChgkV2
  class << self
    def client(token: '', params: {})
      @client = RatingChgkV2::Client.new token: token, params: params
    end

    def reset_client!
      @client = nil
    end
  end
end
