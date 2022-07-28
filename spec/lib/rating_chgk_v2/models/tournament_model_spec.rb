# frozen_string_literal: true

RSpec.describe RatingChgkV2::Models::TournamentModel do
  let(:tournament_id) { 7798 }
  let(:tournament) do
    VCR.use_cassette('tournaments/tournament') do
      test_client.tournament(tournament_id)
    end
  end

  specify '#appeals' do
    appeals = VCR.use_cassette('tournaments/appeals') do
      tournament.appeals
      tournament.appeals # regression to make sure a correct endpoint is requested
    end

    expect(appeals[0].id).to eq(12_153)
    expect(appeals[0].questionNumber).to eq(20)
  end

  specify '#requests' do
    requests = VCR.use_cassette('tournaments/requests') do
      tournament.requests
      tournament.requests # regression to make sure a correct endpoint is requested
    end

    expect(requests[0].id).to eq(101_060)
    expect(requests[0].status).to eq('A')
  end

  specify '#results' do
    results = VCR.use_cassette('tournaments/results') do
      tournament.results includeTeamMembers: 1, includeMasksAndControversials: 1,
                         includeTeamFlags: 1, includeRatingB: 1, town: 202
      tournament.results includeTeamMembers: 1, includeMasksAndControversials: 1,
                         includeTeamFlags: 1, includeRatingB: 1, town: 202
    end.first

    expect(results.team['id']).to eq(53_341)
    expect(results.position).to eq(1)
  end

  it 'works for multiple requests' do
    requests = VCR.use_cassette('tournaments/requests') do
      tournament.requests
    end

    expect(requests[0].id).to eq(101_060)

    appeals = VCR.use_cassette('tournaments/appeals') do
      tournament.appeals
    end

    expect(appeals[0].id).to eq(12_153)
  end
end
