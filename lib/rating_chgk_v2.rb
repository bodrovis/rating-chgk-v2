# frozen_string_literal: true

require 'rating_chgk_v2/client'

module RatingChgkV2
  class << self
    def client(token: '', params: {})
      @client ||= RatingChgkV2::Client.new token: token, params: params
    end

    def reset_client!
      @client = nil
    end
  end
end
