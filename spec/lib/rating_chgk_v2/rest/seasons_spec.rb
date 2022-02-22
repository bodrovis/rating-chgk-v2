# frozen_string_literal: true

RSpec.describe RatingChgkV2::Rest::Seasons do
  describe '#seasons' do
    it 'returns a collection of seasons' do
      seasons = VCR.use_cassette('seasons/all_seasons') do
        test_client.seasons
      end

      expect(seasons.first.dateStart).to eq('2002-09-01T00:00:00+04:00')
    end
  end

  specify '#season' do
    id = 5
    season = VCR.use_cassette('seasons/season') do
      test_client.season id
    end

    expect(season.id).to eq(id)
    expect(season.dateStart).to eq('1999-09-01T00:00:00+04:00')
    expect(season.dateEnd).to eq('2000-08-31T00:00:00+04:00')
  end

  specify '#create_season' do
    data = {
      dateStart: '2022-02-05T19:37:45.004Z',
      dateEnd: '2022-02-05T19:37:45.004Z'
    }
    stub_request(:post, 'https://api.rating.chgk.net/seasons').
      with(body: data).
      to_return(
        status: 200,
        body: JSON.dump(data.merge({id: 0})),
        headers: {}
      )

    season = test_client.create_season data

    expect(season.id).to eq(0)
    expect(season.dateStart).to eq(data[:dateStart])
    expect(season.dateEnd).to eq(data[:dateEnd])
  end

  specify '#update_season' do
    data = {
      dateStart: '2021-02-05T19:37:45.004Z',
      dateEnd: '2021-02-05T19:37:45.004Z'
    }

    stub_request(:put, 'https://api.rating.chgk.net/seasons/0').
      with(body: data).
      to_return(
        status: 200,
        body: JSON.dump(data.merge({id: 0})),
        headers: {}
      )

    season = test_client.update_season 0, data

    expect(season.id).to eq(0)
    expect(season.dateStart).to eq(data[:dateStart])
    expect(season.dateEnd).to eq(data[:dateEnd])
  end

  specify '#delete_season' do
    stub_request(:delete, 'https://api.rating.chgk.net/seasons/0').to_return(status: 204, body: '', headers: {})

    expect(test_client.delete_season(0)).to eq('')
  end
end
