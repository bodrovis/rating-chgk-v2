# frozen_string_literal: true

RSpec.describe RatingChgkV2::Models::SeasonModel do
  let(:season) do
    VCR.use_cassette('seasons/season') do
      test_client.season 5
    end
  end

  specify '#update' do
    data = {
      dateStart: "2021-02-05T19:37:45.004Z",
      dateEnd: "2021-02-05T19:37:45.004Z"
    }

    stub_request(:put, 'https://api.rating.chgk.net/seasons/5').
      with(body: data).
      to_return(
        status: 200,
        body: JSON.dump(data.merge({id: season.id})),
        headers: {}
      )

    updated_season = season.update data
    expect(updated_season).to be_an_instance_of(described_class)
    expect(updated_season.id).to eq(5)
    expect(updated_season.dateStart).to eq(data[:dateStart])
    expect(updated_season.dateEnd).to eq(data[:dateEnd])
  end

  specify '#destroy' do
    stub_request(:delete, 'https://api.rating.chgk.net/seasons/5').to_return(status: 204, body: '', headers: {})

    expect(season.destroy).to eq('')
  end
end
