# frozen_string_literal: true

RSpec.describe RatingChgkV2::Rest::Tournaments do
  let(:tournament_id) { 7798 }

  # rubocop:disable RSpec/MultipleExpectations
  specify '#tournament' do
    tournament = VCR.use_cassette('tournaments/tournament') do
      test_client.tournament(tournament_id)
    end

    expect(tournament.id).to eq(tournament_id)
    expect(tournament.name).to eq('Игры доброй воли')
    expect(tournament.lastEditDate).to eq('2022-03-30T09:34:21+03:00')
    expect(tournament.dateStart).to eq('2022-03-13T13:00:00+03:00')
    expect(tournament.dateEnd).to eq('2022-03-20T13:00:00+03:00')
    expect(tournament.type['id']).to eq(3)
    expect(tournament.orgcommittee.first['id']).to eq(14_450)
    expect(tournament.synchData['dateRequestsAllowedTo']).to eq('2022-03-19T23:55:00+03:00')
    expect(tournament.mainPayment).to eq(300)
    expect(tournament.discountedPayment).to eq(100)
    expect(tournament.discountedPaymentReason).to eq('школьные команды')
    expect(tournament.currency).to eq('r')
    expect(tournament.editors.first['id']).to eq(14_450)
    expect(tournament.tournamentInRatingBalanced).to be(true)
    expect(tournament.difficultyForecast).to eq(2.5)
    expect(tournament.maiiAegis).to be(true)
    expect(tournament.maiiAegisUpdatedAt).to eq('2022-02-12T08:35:02.372430Z')
    expect(tournament.maiiRating).to be(true)
    expect(tournament.maiiRatingUpdatedAt).to eq('2022-02-12T08:35:02.372192Z')
    expect(tournament.questionQty['1']).to eq(9)
  end
  # rubocop:enable RSpec/MultipleExpectations

  describe '#tournaments' do
    it 'returns a collection of tournaments' do
      tournaments = VCR.use_cassette('tournaments/all_tournaments') do
        test_client.tournaments
      end

      expect(tournaments[0].name).to eq('Чемпионат Южного Кавказа')
    end

    it 'returns a collection of tournaments with params' do
      tournaments = VCR.use_cassette('tournaments/all_tournaments_params') do
        test_client.tournaments itemsPerPage: 2, page: 3
      end

      expect(tournaments.count).to eq(2)
      expect(tournaments[0].name).to eq('Бостонское чаепитие')
    end

    it 'handles flat params' do
      tournaments = VCR.use_cassette('tournaments/all_tournaments_params_flat') do
        test_client.tournaments itemsPerPage: 4, 'type[]': [1, 2, 3]
      end

      expect(tournaments[0].type['id']).to eq(2)
    end
  end

  specify '#tournament_appeals' do
    appeals = VCR.use_cassette('tournaments/appeals') do
      test_client.tournament_appeals tournament_id
    end

    expect(appeals[0].id).to eq(12_153)
    expect(appeals[0].questionNumber).to eq(20)
  end

  specify '#tournament_requests' do
    requests = VCR.use_cassette('tournaments/requests') do
      test_client.tournament_requests tournament_id
    end

    expect(requests[0].id).to eq(101_060)
    expect(requests[0].status).to eq('A')
  end

  specify '#tournament_results' do
    results = VCR.use_cassette('tournaments/results') do
      test_client.tournament_results tournament_id, includeTeamMembers: 1, includeMasksAndControversials: 1,
                                                    includeTeamFlags: 1, includeRatingB: 1, town: 202
    end.first

    expect(results.team['id']).to eq(53_341)
    expect(results.mask).to eq('011111111111011110001000000011111110111011111')
    expect(results.current['name']).to eq('Парадные ватники')
    expect(results.rating['b']).to eq(1216)
    expect(results.controversials).to be_empty
    expect(results.flags).to be_empty
    expect(results.teamMembers.first['flag']).to eq('Б')
    expect(results.questionsTotal).to eq(31)
    expect(results.synchRequest['id']).to eq(103_475)
    expect(results.position).to eq(1)
  end

  specify '#create_tournament_result' do
    stub_request(:post, 'https://api.rating.chgk.net/tournaments/1/results').
      with(body: {team: '123', position: 2}).
      to_return(
        status: 200,
        body: '{"team": {"id": 0, "name": "123"}, "position": 2}',
        headers: {}
      )

    result = test_client.create_tournament_result 1, team: '123', position: 2
    expect(result.team['name']).to eq('123')
    expect(result.position).to eq(2)
  end

  specify '#update_tournament_result' do
    stub_request(:put, 'https://api.rating.chgk.net/tournaments/1/results').
      with(body: {team: '123', position: 3}).
      to_return(
        status: 200,
        body: '{"team": {"id": 0, "name": "test"}, "position": 3}',
        headers: {}
      )

    result = test_client.update_tournament_result 1, team: '123', position: 3
    expect(result.team['name']).to eq('test')
    expect(result.position).to eq(3)
  end

  specify '#delete_tournament_result' do
    stub_request(:delete, 'https://api.rating.chgk.net/tournaments/1/results').to_return(status: 204, body: '',
                                                                                         headers: {})

    expect(test_client.delete_tournament_result(1)).to eq('')
  end
end
