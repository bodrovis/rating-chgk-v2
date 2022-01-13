# frozen_string_literal: true

RSpec.describe RatingChgkV2::Client, '#players' do
  # it 'returns a collection of players' do
  #   players = VCR.use_cassette('players/all_players') do
  #     test_client.players
  #   end

  #   puts players.items.inspect
  # end

  it 'returns a collection of players with params' do
    players = VCR.use_cassette('players/all_players_params') do
      test_client.players itemsPerPage: 3, page: 2
    end

    puts players.items.inspect
    puts players.items.first.name
  end

  it 'returns next page' do
    players = VCR.use_cassette('players/all_players_params') do
      test_client.players itemsPerPage: 3, page: 2
    end

    players_next = VCR.use_cassette('players/all_players_next_page') do
      players.next_page
    end

    puts players_next.inspect
  end
end
