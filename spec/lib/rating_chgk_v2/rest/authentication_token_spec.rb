# frozen_string_literal: true

RSpec.describe RatingChgkV2::Rest::AuthenticationToken do
  it 'raises 401 for incorrect email and password' do
    expect do
      VCR.use_cassette('authentication_token/token_401') do
        test_client.authentication_token email: 'fake@example.com', password: '123'
      end
    end.to raise_error(RatingChgkV2::Error::Unauthorized)
  end

  it 'returns token for correct email and password' do
    token_obj = VCR.use_cassette('authentication_token/token') do
      test_client.authentication_token email: ENV['CHGK_EMAIL'], password: ENV['CHGK_PASSWORD']
    end

    expect(token_obj.token).to eq('stubbed_token')
  end
end
