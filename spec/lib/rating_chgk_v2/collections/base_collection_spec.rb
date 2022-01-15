# frozen_string_literal: true

RSpec.describe RatingChgkV2::Collections::BaseCollection do
  let(:players) do
    described_class.new [{
      id: 1,
      name: 'Ivan',
      surname: 'Petrov'
    }, {
      id: 2,
      name: 'Petr',
      surname: 'Ivanov'
    }]
  end

  specify '#first' do
    stub_const "#{described_class}::MODEL", 'Player'

    player = players.first
    expect(player).to be_an_instance_of(RatingChgkV2::Models::PlayerModel)
    expect(player.id).to eq(1)
  end

  specify '#[]' do
    stub_const "#{described_class}::MODEL", 'Player'

    player = players[1]
    expect(player.id).to eq(2)
  end

  specify '#each' do
    stub_const "#{described_class}::MODEL", 'Player'

    klass = RatingChgkV2::Models::PlayerModel

    expect { |b| players.each(&b) }.to yield_successive_args(klass, klass)
  end

  specify '#map' do
    stub_const "#{described_class}::MODEL", 'Player'

    mapped = players.map(&:id)
    expect(mapped).to include(1, 2)
  end
end
