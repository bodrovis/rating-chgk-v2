# frozen_string_literal: true

RSpec.describe RatingChgkV2::Models::VenueModel do
  let!(:venue) do
    VCR.use_cassette('venues/venue') do
      test_client.venue 3601
    end
  end

  specify '#update' do
    stub_request(:put, 'https://api.rating.chgk.net/venues/3601').
      with(body: {name: 'Обновлённая'}).
      to_return(
        status: 201,
        body: '{"id":3601,"name":"Обновлённая"}',
        headers: {}
      )

    updated_venue = venue.update name: 'Обновлённая'
    expect(updated_venue).to be_an_instance_of(described_class)
    expect(updated_venue.name).to eq('Обновлённая')
    expect(updated_venue.id).to eq(3601)
  end

  specify '#destroy' do
    stub_request(:delete, 'https://api.rating.chgk.net/venues/3601').to_return(status: 204, body: '', headers: {})

    expect(venue.destroy).to eq('')
  end

  specify "#requests" do
    result = VCR.use_cassette('venues/requests') do
      venue.requests
      venue.requests
    end

    expect(result.items.size).to eq 4

    expect(result.first.tournamentId).to eq 5751
  end
end
