# frozen_string_literal: true

RSpec.shared_examples 'paginated' do
  let(:endpoint) { RatingChgkV2::Endpoints::BaseEndpoint.new test_client }
  let(:collection) { described_class.new [], endpoint }

  specify '#next_page!' do
    allow(endpoint).to receive(:do_get).and_return([{paginated: true}])
    expect(endpoint.params[:page]).to be_nil

    expect(collection.next_page!).to be_an_instance_of(described_class)
    expect(endpoint).to have_received(:do_get)

    expect(collection.first.class.superclass).to eq(RatingChgkV2::Models::BaseModel)
    expect(endpoint.params[:page]).to eq(2)
  end

  describe '#prev_page!' do
    it 'fetches the previous page' do
      allow(endpoint).to receive(:do_get).and_return([{paginated: true}])
      allow(endpoint.params).to receive(:[]).with(:page).and_return(3)

      expect(collection.prev_page!).to be_an_instance_of(described_class)
      expect(endpoint).to have_received(:do_get)

      expect(collection.first.class.superclass).to eq(RatingChgkV2::Models::BaseModel)
      expect(endpoint.params[:page]).to eq(2)
    end

    it 'does not fetch anything when the page is the first one' do
      allow(endpoint).to receive(:do_get).and_return([{paginated: true}])
      expect(endpoint.params[:page]).to be_nil

      expect(collection.prev_page!).to be_nil
      expect(endpoint).not_to have_received(:do_get)

      expect(collection.first).to be_nil
      expect(endpoint.params[:page]).to be_nil
    end
  end
end
