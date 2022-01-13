# frozen_string_literal: true

require_relative 'rest/players'

module RatingChgkV2
  class Client
    include RatingChgkV2::Rest::Players

    attr_reader :token
    attr_accessor :timeout, :open_timeout

    def initialize(token: '', params: {})
      @token = token
      @timeout = params.fetch(:timeout, nil)
      @open_timeout = params.fetch(:open_timeout, nil)
    end
  end
end
