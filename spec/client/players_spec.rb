RSpec.describe RatingChgkV2::Client do
  describe '#players' do
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
  end
end