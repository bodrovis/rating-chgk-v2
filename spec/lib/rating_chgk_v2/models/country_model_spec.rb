# frozen_string_literal: true

RSpec.describe RatingChgkV2::Models::CountryModel do
  let!(:country) do
    VCR.use_cassette('countries/country') do
      test_client.country 20
    end
  end

  specify '#update' do
    stub_request(:put, 'https://api.rating.chgk.net/countries/20').
      with(body: {name: 'Обновлённая страна'}).
      to_return(
        status: 200,
        body: '{"id":20,"name":"Обновлённая страна"}',
        headers: {}
      )

    updated_country = country.update name: 'Обновлённая страна'
    expect(updated_country).to be_an_instance_of(described_class)
    expect(updated_country.name).to eq('Обновлённая страна')
    expect(updated_country.id).to eq(20)
  end

  specify '#destroy' do
    stub_request(:delete, 'https://api.rating.chgk.net/countries/20').to_return(status: 204, body: '', headers: {})

    expect(country.destroy).to eq('')
  end
end
