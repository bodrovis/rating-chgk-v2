# frozen_string_literal: true

RSpec.describe RatingChgkV2::Rest::TournamentTypes do
  let(:id) { 3 }

  specify '#tournament_types' do
    t_type = VCR.use_cassette('tournament_types/tournament_types') do
      test_client.tournament_types
    end.first

    expect(t_type.id).to eq(1)
    expect(t_type.name).to eq('Неизвестный')
  end

  specify '#tournament_type' do
    t_type = VCR.use_cassette('tournament_types/tournament_type') do
      test_client.tournament_type id
    end

    expect(t_type.id).to eq(id)
    expect(t_type.name).to eq('Синхрон')
  end
end
