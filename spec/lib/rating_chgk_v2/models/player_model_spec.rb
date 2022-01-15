# frozen_string_literal: true

RSpec.describe RatingChgkV2::Models::PlayerModel do
  let(:player) do
    VCR.use_cassette('players/player') do
      test_client.player(player_id)
    end
  end

  let(:player_id) { 1110 }

  describe '#seasons' do
    it 'returns all seasons' do
      player_seasons = VCR.use_cassette('players/player_seasons') do
        player.seasons
      end

      expect(player_seasons).to be_an_instance_of(RatingChgkV2::Collections::PlayerSeasonsCollection)
      season = player_seasons.first

      expect(season.idplayer).to eq(player_id)
      expect(season.idseason).to eq(7)
    end

    it 'returns seasons by params' do
      season = VCR.use_cassette('players/player_seasons_params') do
        player.seasons itemsPerPage: 2, idseason: 8, idteam: 7456
      end.first

      expect(season.idplayer).to eq(player_id)
      expect(season.idseason).to eq(8)
      expect(season.idteam).to eq(7456)
    end
  end

  describe '#tournaments' do
    it 'returns all tournaments' do
      player_tournaments = VCR.use_cassette('players/player_tournaments') do
        player.tournaments
      end

      expect(player_tournaments).to be_an_instance_of(RatingChgkV2::Collections::PlayerTournamentsCollection)
      tour = player_tournaments.first

      expect(tour.idtournament).to eq(314)
      expect(tour.idteam).to eq(7121)
    end

    it 'returns tournaments by params' do
      tour = VCR.use_cassette('players/player_tournaments_params') do
        player.tournaments itemsPerPage: 2
      end.first

      expect(tour.idplayer).to eq(player_id)
      expect(tour.idtournament).to eq(314)
      expect(tour.idteam).to eq(7121)
    end
  end
end
