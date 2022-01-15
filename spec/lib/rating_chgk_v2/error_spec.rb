# frozen_string_literal: true

RSpec.describe RatingChgkV2::Error do
  it 'raises NotFound for 404 status code' do
    expect do
      VCR.use_cassette('error/error_404') do
        test_client.player(3)
      end
    end.to raise_error(RatingChgkV2::Error::NotFound)
  end
end
