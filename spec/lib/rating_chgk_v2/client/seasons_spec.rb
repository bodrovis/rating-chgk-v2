# frozen_string_literal: true

RSpec.describe RatingChgkV2::Client, 'seasons' do
  describe '#seasons' do
    it 'returns a collection of seasons' do
      seasons = VCR.use_cassette('seasons/all_seasons') do
        test_client.seasons
      end

      expect(seasons.first.dateStart).to eq('2002-09-01T00:00:00+04:00')
    end
  end
end
