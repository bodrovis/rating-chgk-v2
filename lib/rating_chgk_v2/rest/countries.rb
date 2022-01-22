# frozen_string_literal: true

module RatingChgkV2
  module Rest
    module Countries
      def countries(params = {})
        RatingChgkV2::Collections::CountriesCollection.load :do_get, countries_endpoint([], params)
      end

      def country(id)
        RatingChgkV2::Models::CountryModel.load :do_get, countries_endpoint(id)
      end

      private

      def countries_endpoint(query, params = {})
        RatingChgkV2::Endpoints::CountriesEndpoint.new self, query, params
      end
    end
  end
end
