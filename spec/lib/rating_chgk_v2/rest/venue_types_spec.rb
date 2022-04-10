# frozen_string_literal: true

RSpec.describe RatingChgkV2::Rest::VenueTypes do
  let(:type_id) { 1 }

  specify '#venue_type' do
    venue_type = VCR.use_cassette('venue_types/venue_type') do
      test_client.venue_type(type_id)
    end

    expect(venue_type.id).to eq(type_id)
    expect(venue_type.name).to eq('Постоянная')
  end

  describe '#venue_types' do
    it 'returns a collection of venue types' do
      types = VCR.use_cassette('venue_types/venue_types') do
        test_client.venue_types
      end

      expect(types[0].name).to eq('Постоянная')
    end

    it 'returns a collection of venue types with params' do
      types = VCR.use_cassette('venue_types/all_venue_types_params') do
        test_client.venue_types itemsPerPage: 3, page: 2
      end

      expect(types[0].name).to eq('Разовая')
    end
  end

  specify '#create_venue_type' do
    stub_request(:post, 'https://api.rating.chgk.net/venue_types').
      with(body: {name: 'Фейковая'}).
      to_return(
        status: 201,
        body: '{"id":0,"name":"Фейковая"}',
        headers: {}
      )

    venue_type = test_client.create_venue_type name: 'Фейковая'
    expect(venue_type.name).to eq('Фейковая')
    expect(venue_type.id).to eq(0)
  end
end
