# frozen_string_literal: true

RSpec.describe RatingChgkV2::Models::TeamModel do
  let(:team_id) { 2 }
  let(:team) do
    VCR.use_cassette('teams/team') do
      test_client.team(team_id)
    end
  end

  describe '#seasons' do
    it 'returns seasons by params' do
      season = VCR.use_cassette('teams/team_seasons_params') do
        team.seasons idseason: 9
      end.first

      expect(season).to be_an_instance_of(RatingChgkV2::Models::PlayerSeasonModel)
      expect(season.idplayer).to eq(707)
      expect(season.idseason).to eq(9)
      expect(season.idteam).to eq(team_id)
    end
  end

  describe '#tournaments' do
    it 'returns tournaments by params' do
      tour = VCR.use_cassette('teams/team_tournaments_params') do
        team.tournaments pagination: true
      end[2]

      expect(tour).to be_an_instance_of(RatingChgkV2::Models::TeamTournamentModel)
      expect(tour.idtournament).to eq(8)
      expect(tour.idteam).to eq(team_id)
    end
  end
end
