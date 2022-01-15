# frozen_string_literal: true

RSpec.describe RatingChgkV2::Client, '#players' do
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
  end
end
