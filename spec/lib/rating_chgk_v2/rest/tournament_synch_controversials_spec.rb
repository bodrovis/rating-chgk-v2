# frozen_string_literal: true

RSpec.describe RatingChgkV2::Rest::TournamentSynchControversials do
  let(:id) { 1000 }

  specify '#tournament_synch_controversial' do
    contr = VCR.use_cassette('tournament_synch_controversial/tournament_synch_controversia') do
      test_client.tournament_synch_controversial id
    end

    expect(contr.id).to eq(id)
    expect(contr.questionNumber).to eq(26)
    expect(contr.answer).to eq('валяться')
    expect(contr.issuedAt).to eq('2012-01-31T09:26:32+04:00')
    expect(contr.status).to eq('D')
    expect(contr.comment).to eq('')
    expect(contr.resolvedAt).to eq('2012-01-31T15:26:32+04:00')
    expect(contr.appealJuryComment).to be_nil
  end
end
