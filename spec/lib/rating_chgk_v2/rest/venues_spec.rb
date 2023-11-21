# frozen_string_literal: true

RSpec.describe RatingChgkV2::Rest::Venues do
  let(:venue_id) { 3601 }

  specify '#venue' do
    venue = VCR.use_cassette('venues/venue') do
      test_client.venue(venue_id)
    end

    expect(venue.id).to eq(venue_id)
    expect(venue.name).to eq('Библиотека')
    expect(venue.town['name']).to eq('Витебск')
    expect(venue.type['name']).to eq('Постоянная')
    expect(venue.address).to eq('Витебск, пр. Фрунзе 30а')
    expect(venue.urls.first).to include('vk.com')
  end

  describe '#venues' do
    it 'returns a collection of venues' do
      venues = VCR.use_cassette('venues/venues') do
        test_client.venues
      end

      expect(venues[0].id).to eq(3030)
    end

    it 'returns a collection of venues with params' do
      venues = VCR.use_cassette('venues/all_venues_params') do
        test_client.venues itemsPerPage: 3, page: 2
      end

      expect(venues.count).to eq(3)
      expect(venues[0].name).to eq('Ереван')
    end
  end

  specify '#create_venue' do
    stub_request(:post, 'https://api.rating.chgk.net/venues').
      with(body: {name: 'Фейк', type: {name: 'Фейковый тип'}}).
      to_return(
        status: 201,
        body: '{"id":0,"name":"Фейк","type":{"id":0,"name":"Фейковый тип"}}',
        headers: {}
      )

    venue = test_client.create_venue name: 'Фейк', type: {name: 'Фейковый тип'}
    expect(venue.name).to eq('Фейк')
    expect(venue.type['id']).to eq(0)
  end

  specify '#update_venue' do
    stub_request(:patch, 'https://api.rating.chgk.net/venues/0').
      with(body: {name: 'Обновлённая'}).
      to_return(
        status: 200,
        body: '{"id":0,"name":"Обновлённая"}',
        headers: {}
      )

    venue = test_client.update_venue 0, name: 'Обновлённая'
    expect(venue.name).to eq('Обновлённая')
    expect(venue.id).to eq(0)
  end

  specify '#delete_country' do
    stub_request(:delete, 'https://api.rating.chgk.net/venues/1').to_return(status: 204, body: '', headers: {})

    expect(test_client.delete_venue(1)).to eq('')
  end
end
