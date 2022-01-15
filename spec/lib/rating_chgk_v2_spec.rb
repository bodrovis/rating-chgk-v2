# frozen_string_literal: true

RSpec.describe RatingChgkV2 do
  specify '.reset_client!' do
    described_class.reset_client!
    current_client = described_class.instance_variable_get :@client
    expect(current_client).to be_nil
  end
end
