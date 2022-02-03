# frozen_string_literal: true

require 'yaml'
require 'faraday'
require 'addressable/template'
require 'forwardable'

require 'rating_chgk_v2/version'
require 'rating_chgk_v2/json_handler'
require 'rating_chgk_v2/connection'
require 'rating_chgk_v2/request'
require 'rating_chgk_v2/error'

require 'rating_chgk_v2/utils/string_utils'

require 'rating_chgk_v2/concerns/paginated'

require 'rating_chgk_v2/endpoints/base_endpoint'
require 'rating_chgk_v2/endpoints/players_endpoint'
require 'rating_chgk_v2/endpoints/countries_endpoint'
require 'rating_chgk_v2/endpoints/regions_endpoint'
require 'rating_chgk_v2/endpoints/authentication_token_endpoint'
require 'rating_chgk_v2/endpoints/seasons_endpoint'
require 'rating_chgk_v2/endpoints/releases_endpoint'

require 'rating_chgk_v2/models/base_model'
require 'rating_chgk_v2/models/player_model'
require 'rating_chgk_v2/models/player_season_model'
require 'rating_chgk_v2/models/player_tournament_model'
require 'rating_chgk_v2/models/country_model'
require 'rating_chgk_v2/models/region_model'
require 'rating_chgk_v2/models/authentication_token_model'
require 'rating_chgk_v2/models/season_model'
require 'rating_chgk_v2/models/release_model'

require 'rating_chgk_v2/collections/base_collection'
require 'rating_chgk_v2/collections/players_collection'
require 'rating_chgk_v2/collections/player_seasons_collection'
require 'rating_chgk_v2/collections/player_tournaments_collection'
require 'rating_chgk_v2/collections/countries_collection'
require 'rating_chgk_v2/collections/regions_collection'
require 'rating_chgk_v2/collections/seasons_collection'
require 'rating_chgk_v2/collections/releases_collection'

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
