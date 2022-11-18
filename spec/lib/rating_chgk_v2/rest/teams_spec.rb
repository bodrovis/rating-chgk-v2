# frozen_string_literal: true

RSpec.describe RatingChgkV2::Rest::Teams do
  let(:team_id) { 2 }

  specify '#team' do
    team = VCR.use_cassette('teams/team') do
      test_client.team(team_id)
    end

    expect(team.id).to eq(team_id)
    expect(team.name).to eq('Афина')
    expect(team.town['id']).to eq(201)
  end

  describe '#teams' do
    it 'returns a collection of teams' do
      teams = VCR.use_cassette('teams/all_teams') do
        test_client.teams
      end

      expect(teams[1].name).to eq('Афина')
      expect(teams[1].id).to eq(2)
      expect(teams[1].town['id']).to eq(201)
    end

    it 'returns a collection of teams with params' do
      teams = VCR.use_cassette('teams/all_teams_params') do
        test_client.teams itemsPerPage: 2, name: 'Н', page: 3
      end

      expect(teams.count).to eq(2)
      expect(teams[0].name).to eq('Миллениум')
      expect(teams[0].id).to eq(11)
      expect(teams[0].town['id']).to eq(282)
    end
  end

  describe '#team_seasons' do
    it 'returns seasons by params' do
      team_seasons = VCR.use_cassette('teams/team_seasons_params') do
        test_client.team_seasons team_id, idseason: 9
      end

      expect(team_seasons).to be_an_instance_of(RatingChgkV2::Collections::PlayerSeasonsCollection)
      season = team_seasons.first

      expect(season.idplayer).to eq(707)
      expect(season.idseason).to eq(9)
      expect(season.idteam).to eq(team_id)
    end
  end

  describe '#team_tournaments' do
    it 'returns a collection of team tournaments with params' do
      team_tournaments = VCR.use_cassette('teams/team_tournaments_params') do
        test_client.team_tournaments team_id, pagination: true
      end

      tour = team_tournaments[2]

      expect(tour.idtournament).to eq(8)
      expect(tour.idteam).to eq(team_id)
    end
  end

  specify '#create_team' do
    stub_request(:post, 'https://api.rating.chgk.net/teams').
      with(body: {name: 'Команда А'}).
      to_return(
        status: 200,
        body: '{"id":0,"name":"Команда А"}',
        headers: {}
      )

    team = test_client.create_team name: 'Команда А'
    expect(team.name).to eq('Команда А')
    expect(team.id).to eq(0)
  end

  specify '#update_team' do
    stub_request(:put, 'https://api.rating.chgk.net/teams/0').
      with(body: {name: 'Команда Ы'}).
      to_return(
        status: 200,
        body: '{"id":0,"name":"Команда Ы"}',
        headers: {}
      )

    team = test_client.update_team 0, name: 'Команда Ы'
    expect(team.name).to eq('Команда Ы')
    expect(team.id).to eq(0)
  end

  specify '#delete_team' do
    stub_request(:delete, 'https://api.rating.chgk.net/teams/0').to_return(status: 204, body: '', headers: {})

    expect(test_client.delete_team(0)).to eq('')
  end
end
