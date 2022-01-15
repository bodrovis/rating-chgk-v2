# frozen_string_literal: true

RSpec.describe RatingChgkV2::Connection do
  include described_class

  before { RatingChgkV2.reset_client! }

  after { RatingChgkV2.reset_client! }

  it 'allows to customize timeouts' do
    custom_client = RatingChgkV2.client(params: {open_timeout: 100, timeout: 500})
    conn = connection custom_client
    expect(conn.options.timeout).to eq(500)
    expect(conn.options.open_timeout).to eq(100)

    custom_client.timeout = 300
    custom_client.open_timeout = 200
    another_conn = connection custom_client
    expect(another_conn.options.timeout).to eq(300)
    expect(another_conn.options.open_timeout).to eq(200)
  end
end
