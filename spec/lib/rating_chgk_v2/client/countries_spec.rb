# frozen_string_literal: true

RSpec.describe RatingChgkV2::Client, 'countries' do
  describe '#countries' do
    it 'returns a collection of countries' do
      countries = VCR.use_cassette('countries/all_countries') do
        test_client.countries
      end

      expect(countries[1].name).to eq('Австралия')
      expect(countries[1].id).to eq(2)
    end

    it 'returns a collection of countries with params' do
      countries = VCR.use_cassette('countries/all_countries_params') do
        test_client.countries itemsPerPage: 2, name: 'Бе'
      end

      expect(countries.items.size).to eq(2)
      expect(countries.first.name).to eq('Беларусь')
      expect(countries.first.id).to eq(5)
    end
  end

  specify '#country' do
    id = 20
    country = VCR.use_cassette('countries/country') do
      test_client.country id
    end

    expect(country.name).to eq('Нидерланды')
    expect(country.id).to eq(id)
  end
end
