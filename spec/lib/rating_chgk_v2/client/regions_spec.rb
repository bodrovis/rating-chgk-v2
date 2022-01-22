# frozen_string_literal: true

RSpec.describe RatingChgkV2::Client, 'regions' do
  describe '#regions' do
    it 'returns a collection of regions' do
      regions = VCR.use_cassette('regions/all_regions') do
        test_client.regions
      end

      expect(regions.last.name).to eq('Воронежская область')
      expect(regions.last.id).to eq(30)
      expect(regions.last.country['name']).to eq('Россия')
    end

    it 'returns a collection of regions with params' do
      regions = VCR.use_cassette('regions/all_regions_params') do
        test_client.regions itemsPerPage: 3, country: 'Россия'
      end

      expect(regions.items.size).to eq(3)
      expect(regions[1].name).to eq('Адыгея')
      expect(regions[1].country['name']).to eq('Россия')
      expect(regions[1].id).to eq(2)
    end
  end

  specify '#region' do
    id = 3
    region = VCR.use_cassette('regions/region') do
      test_client.region id
    end

    expect(region.name).to eq('Акмолинская область')
    expect(region.country['name']).to eq('Казахстан')
    expect(region.id).to eq(id)
  end
end
