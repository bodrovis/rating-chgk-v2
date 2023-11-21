# frozen_string_literal: true

RSpec.describe RatingChgkV2::Rest::Countries do
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

  describe '#create_country' do
    before { RatingChgkV2.reset_client! }

    after { RatingChgkV2.reset_client! }

    it 'raises an error when the token is invalid' do
      custom_client = RatingChgkV2.client token: 'fake_token'

      expect do
        VCR.use_cassette('countries/create_country_incorrect_token') do
          custom_client.create_country name: 'test'
        end
      end.to raise_error(RatingChgkV2::Error::Unauthorized)
    end

    it 'creates a country' do
      stub_request(:post, 'https://api.rating.chgk.net/countries').
        with(body: {name: 'Темерия'}).
        to_return(
          status: 200,
          body: '{"id":0,"name":"Темерия"}',
          headers: {}
        )

      country = test_client.create_country name: 'Темерия'
      expect(country.name).to eq('Темерия')
      expect(country.id).to eq(0)
    end
  end

  specify '#update_country' do
    stub_request(:patch, 'https://api.rating.chgk.net/countries/0').
      with(body: {name: 'Лирия'}).
      to_return(
        status: 200,
        body: '{"id":0,"name":"Лирия"}',
        headers: {}
      )

    country = test_client.update_country 0, name: 'Лирия'
    expect(country.name).to eq('Лирия')
    expect(country.id).to eq(0)
  end

  describe '#delete_country' do
    it 'raises an error when the token is invalid' do
      expect do
        VCR.use_cassette('countries/delete_country_incorrect_token') do
          test_client.delete_country 1
        end
      end.to raise_error(RatingChgkV2::Error::Unauthorized)
    end

    it 'deletes a country' do
      stub_request(:delete, 'https://api.rating.chgk.net/countries/1').to_return(status: 204, body: '', headers: {})

      expect(test_client.delete_country(1)).to eq('')
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
