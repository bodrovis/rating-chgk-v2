# frozen_string_literal: true

RSpec.describe RatingChgkV2::Rest::TournamentFlags do
  let(:id) { 2 }

  describe '#tournament_flags' do
    it 'returns a collection of tournament flags' do
      flag = VCR.use_cassette('tournament_flags/all_tournament_flags') do
        test_client.tournament_flags
      end.first

      expect(flag.id).to eq(1)
      expect(flag.shortName).to eq('!')
      expect(flag.longName).to eq('Общий зачёт')
    end
  end

  specify '#tournament_flag' do
    flag = VCR.use_cassette('tournament_flags/tournament_flag') do
      test_client.tournament_flag id
    end

    expect(flag.id).to eq(id)
    expect(flag.shortName).to eq('МШ')
    expect(flag.longName).to eq('Младшие школьники (5-9 классы)')
  end
end
