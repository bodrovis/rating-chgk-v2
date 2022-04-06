# frozen_string_literal: true

RSpec.describe RatingChgkV2::Rest::Towns do
  let(:town_id) { 1 }

  specify '#town' do
    town = VCR.use_cassette('towns/town') do
      test_client.town(town_id)
    end

    expect(town.id).to eq(town_id)
    expect(town.name).to eq('Абакан')
    expect(town.region['name']).to eq('Хакасия')
    expect(town.country['name']).to eq('Россия')
  end

  describe '#towns' do
    it 'returns a collection of towns' do
      towns = VCR.use_cassette('towns/all_towns') do
        test_client.towns
      end

      expect(towns[0].name).to eq('Абакан')
    end

    it 'returns a collection of towns with params' do
      towns = VCR.use_cassette('towns/all_towns_params') do
        test_client.towns itemsPerPage: 2, page: 3
      end

      expect(towns.count).to eq(2)
      expect(towns[0].name).to eq('Анапа')
    end
  end
end
