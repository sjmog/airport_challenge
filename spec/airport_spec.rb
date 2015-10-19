require 'airport'

describe Airport do
  subject(:no_capacity_airport) { described_class.new(0) }
  subject(:airport_with_capacity) { described_class.new(20) }

  it 'can be created with a capacity' do
    expect { described_class.new(20) }.not_to raise_error
  end

  describe '#full?' do
    context 'when at capacity' do
      it 'returns true' do
        expect(no_capacity_airport).to be_full
      end
    end

    context 'when not at capacity' do
      it 'returns false' do
        expect(airport_with_capacity).not_to be_full
      end
    end
  end

  it { is_expected.to respond_to :stormy? }
end