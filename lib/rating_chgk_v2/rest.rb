# frozen_string_literal: true

require 'rating_chgk_v2/rest/authentication_token'
require 'rating_chgk_v2/rest/countries'
require 'rating_chgk_v2/rest/players'
require 'rating_chgk_v2/rest/regions'
require 'rating_chgk_v2/rest/releases'
require 'rating_chgk_v2/rest/seasons'

module RatingChgkV2
  module Rest
    include RatingChgkV2::Rest::AuthenticationToken
    include RatingChgkV2::Rest::Countries
    include RatingChgkV2::Rest::Players
    include RatingChgkV2::Rest::Regions
    include RatingChgkV2::Rest::Releases
    include RatingChgkV2::Rest::Seasons

    private

    def endpoint(name, query, params = {})
      klass = RatingChgkV2.const_get "Endpoints::#{name}Endpoint"
      klass.new self, query, params
    end

    def collection_load(name:, ep_params:, ep_name: nil, method: :do_get)
      collection(name).load method, endpoint(ep_name || name, *ep_params)
    end

    def model_load(name:, ep_params:, ep_name: nil, method: :do_get)
      model(name).load method, endpoint(ep_name || name, *ep_params)
    end

    def collection(name)
      RatingChgkV2.const_get("Collections::#{name}Collection")
    end

    def model(name)
      RatingChgkV2.const_get("Models::#{name}Model")
    end
  end
end
