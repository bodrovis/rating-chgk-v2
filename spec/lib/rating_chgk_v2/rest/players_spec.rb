# frozen_string_literal: true

RSpec.describe RatingChgkV2::Rest::Players do
  let(:player_id) { 1110 }

  specify '#player' do
    player = VCR.use_cassette('players/player') do
      test_client.player(player_id)
    end

    expect(player.id).to eq(player_id)
    expect(player.name).to eq('Александр')
    expect(player.surname).to eq('Андрианов')
    expect(player.patronymic).to eq('Сергеевич')
  end

  describe '#player_tournaments' do
    it 'returns a collection of player tournaments' do
      player_tournaments = VCR.use_cassette('players/player_tournaments') do
        test_client.player_tournaments player_id
      end

      expect(player_tournaments).to be_an_instance_of(RatingChgkV2::Collections::PlayerTournamentsCollection)
      tour = player_tournaments.first

      expect(tour.idplayer).to eq(player_id)
      expect(tour.idtournament).to eq(314)
      expect(tour.idteam).to eq(7121)
    end

    it 'returns a collection of player tournaments next page' do
      player_tournaments = VCR.use_cassette('players/player_tournaments_params') do
        test_client.player_tournaments player_id, itemsPerPage: 2
      end

      tour = player_tournaments[1]

      expect(tour.idplayer).to eq(player_id)
      expect(tour.idtournament).to eq(400)
      expect(tour.idteam).to eq(7456)

      VCR.use_cassette('players/player_tournaments_next_page') do
        player_tournaments.next_page!
      end

      tour = player_tournaments[0]

      expect(tour.idplayer).to eq(player_id)
      expect(tour.idtournament).to eq(314)
      expect(tour.idteam).to eq(7121)
      expect(player_tournaments.endpoint.params[:itemsPerPage]).to eq(2)
    end
  end

  describe '#player_seasons' do
    it 'returns a collection of player seasons' do
      player_seasons = VCR.use_cassette('players/player_seasons') do
        test_client.player_seasons player_id
      end

      expect(player_seasons).to be_an_instance_of(RatingChgkV2::Collections::PlayerSeasonsCollection)
      season = player_seasons.first

      expect(season.idplayer).to eq(player_id)
      expect(season.idseason).to eq(7)
      expect(season.idteam).to eq(7121)
      expect(season.dateAdded).to eq('2007-09-23T00:00:00+04:00')
      expect(season.dateRemoved).to be_nil
      expect(season.playerNumber).to eq(0)
    end

    it 'returns seasons by params' do
      player_seasons = VCR.use_cassette('players/player_seasons_params') do
        test_client.player_seasons player_id, itemsPerPage: 2, idseason: 8, idteam: 7456
      end

      expect(player_seasons).to be_an_instance_of(RatingChgkV2::Collections::PlayerSeasonsCollection)
      season = player_seasons.first

      expect(season.idplayer).to eq(player_id)
      expect(season.idseason).to eq(8)
      expect(season.idteam).to eq(7456)
    end
  end

  describe '#players' do
    it 'returns a collection of players' do
      players = VCR.use_cassette('players/all_players') do
        test_client.players
      end

      expect(players[0].surname).to eq('Абабилов')
      expect(players[0].id).to eq(1)
    end

    it 'returns next page' do
      players = VCR.use_cassette('players/all_players_params') do
        test_client.players itemsPerPage: 3, page: 2
      end

      expect(players[0].name).to eq('Артур')
      expect(players[0].id).to eq(12)

      VCR.use_cassette('players/all_players_next_page') do
        players.next_page!
      end

      expect(players[0].name).to eq('Олег')
      expect(players[0].id).to eq(15)
      expect(players.endpoint.params[:itemsPerPage]).to eq(3)
    end

    it 'returns previous page' do
      players = VCR.use_cassette('players/all_players_params') do
        test_client.players itemsPerPage: 3, page: 2
      end

      VCR.use_cassette('players/all_players_prev_page') do
        players.prev_page!
      end

      expect(players[0].surname).to eq('Абабилов')
      expect(players.endpoint.params[:itemsPerPage]).to eq(3)
    end
  end

  specify '#update_player' do
    stub_request(:put, 'https://api.rating.chgk.net/players/0').
      with(body: {name: 'Акваменов'}).
      to_return(
        status: 200,
        body: '{"id":0,"name":"Акваменов"}',
        headers: {}
      )

    player = test_client.update_player 0, name: 'Акваменов'
    expect(player.name).to eq('Акваменов')
    expect(player.id).to eq(0)
  end

  describe '#delete_player' do
    it 'raises an error when the token is invalid' do
      expect do
        VCR.use_cassette('players/delete_player_incorrect_token') do
          test_client.delete_player 1
        end
      end.to raise_error(RatingChgkV2::Error::Unauthorized)
    end

    it 'delete a player' do
      stub_request(:delete, 'https://api.rating.chgk.net/players/1').to_return(status: 204, body: '', headers: {})

      expect(test_client.delete_player(1)).to eq('')
    end
  end
end
