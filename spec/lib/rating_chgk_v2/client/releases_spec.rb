# frozen_string_literal: true

RSpec.describe RatingChgkV2::Client, 'releases' do
  describe '#releases' do
    it 'returns a collection of releases' do
      releases = VCR.use_cassette('releases/all_releases') do
        test_client.releases
      end

      expect(releases.first.date).to eq('2003-07-01T00:00:00+04:00')
    end

    it 'returns a collection of releases with params' do
      releases = VCR.use_cassette('releases/all_releases_params') do
        test_client.releases itemsPerPage: 3, page: 2
      end

      expect(releases.items.size).to eq(3)
      expect(releases.first.realDate).to eq('2005-04-01T00:00:00+04:00')
    end
  end

  specify '#release' do
    id = 4
    release = VCR.use_cassette('releases/release') do
      test_client.release id
    end

    expect(release.lastRunRefresh).to eq('2015-02-09T15:51:22+03:00')
    expect(release.realDate).to eq('2005-04-01T00:00:00+04:00')
    expect(release.date).to eq('2005-04-01T00:00:00+04:00')
    expect(release.id).to eq(id)
  end
end
