# frozen_string_literal: true

require 'yaml'
require 'faraday'
require 'addressable/template'

require 'rating_chgk_v2/version'
require 'rating_chgk_v2/json_handler'
require 'rating_chgk_v2/connection'
require 'rating_chgk_v2/request'
require 'rating_chgk_v2/error'

require 'rating_chgk_v2/utils/string_utils'

require 'rating_chgk_v2/endpoints/base_endpoint'
require 'rating_chgk_v2/endpoints/players_endpoint'

require 'rating_chgk_v2/models/base_model'
require 'rating_chgk_v2/models/player_model'
require 'rating_chgk_v2/models/player_season_model'
require 'rating_chgk_v2/models/player_tournament'

require 'rating_chgk_v2/collections/base_collection'
require 'rating_chgk_v2/collections/players_collection'
require 'rating_chgk_v2/collections/player_seasons_collection'
require 'rating_chgk_v2/collections/player_tournaments'

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
