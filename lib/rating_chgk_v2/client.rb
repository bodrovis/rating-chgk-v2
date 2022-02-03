# frozen_string_literal: true

require 'rating_chgk_v2/rest'

module RatingChgkV2
  class Client
    include RatingChgkV2::Rest

    attr_reader :token
    attr_accessor :timeout, :open_timeout

    def initialize(token: '', params: {})
      @token = token
      @timeout = params.fetch(:timeout, nil)
      @open_timeout = params.fetch(:open_timeout, nil)
    end
  end
end
