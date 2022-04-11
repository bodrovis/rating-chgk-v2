# frozen_string_literal: true

RSpec.describe RatingChgkV2::Rest::TournamentSynchAppeals do
  let(:id) { 1000 }

  specify '#tournament_synch_appeal' do
    appeal = VCR.use_cassette('tournament_synch_appeals/tournament_synch_appeal') do
      test_client.tournament_synch_appeal id
    end

    expect(appeal.id).to eq(id)
    expect(appeal.idtournament).to eq(2225)
    expect(appeal.type).to eq('A')
    expect(appeal.issuedAt).to eq('2013-04-19T22:28:10+04:00')
    expect(appeal.status).to eq('D')
    expect(appeal.appeal).to include('Из текста вопроса следует')
    expect(appeal.comment).to include('В воспоминаниях фигурирует')
    expect(appeal.overriddenBy).to be_nil
    expect(appeal.questionNumber).to eq(8)
    expect(appeal.answer).to be_nil
  end
end
