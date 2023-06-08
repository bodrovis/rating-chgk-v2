# frozen_string_literal: true

RSpec.describe RatingChgkV2::Rest::TournamentSynchRequests do
  let(:id) { 1000 }

  specify '#tournament_synch_requests' do
    req = VCR.use_cassette('tournament_synch_requests/tournament_synch_request') do
      test_client.tournament_synch_request id
    end

    expect(req.id).to eq(id)
    expect(req.status).to eq('A')
    expect(req.venue['name']).to eq('Павлодар')
    expect(req.representative['name']).to eq('Айбек')
    expect(req.narrator['surname']).to eq('Логвиненко')
    expect(req.approximateTeamsCount).to be_nil
    expect(req.issuedAt).to eq('2012-09-21T10:30:14+04:00')
    expect(req.tournamentId).to eq(2180)
    expect(req.dateStart).to eq('2012-10-13T17:00:00+04:00')
  end
end
