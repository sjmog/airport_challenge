require 'airport'

describe Airport do
  let(:weather_reporter) { double :weather_reporter }
  subject(:airport) { described_class.new(capacity: 20, weather_reporter: weather_reporter) }
  let(:plane) { double :plane }

  describe '#land' do
    context 'when not stormy' do
      before do
        allow(weather_reporter).to receive(:stormy?).and_return false
      end

      it 'instructs a plane to land' do
        expect(airport).to respond_to(:land).with(1).argument
      end

      context 'when full' do
        before do
          20.times { airport.land(plane) }
        end

        it 'raises an error' do
          expect { airport.land(plane) }.to raise_error 'Cannot land plane: airport full'
        end
      end
    end

    context 'when stormy' do
      before do
        allow(weather_reporter).to receive(:stormy?).and_return true
      end

      it 'raises an error' do
        expect { airport.land(plane) }.to raise_error 'Cannot land plane: weather is stormy'
      end
    end
  end

  describe '#take_off' do
    context 'when not stormy' do
      before do
        allow(weather_reporter).to receive(:stormy?).and_return false
      end

      it 'instructs a plane to take off' do
        expect(airport).to respond_to(:take_off).with(1).argument
      end

      it 'raises an error if plane is not at this airport' do
        other_airport = described_class.new(capacity: 20, weather_reporter: weather_reporter)
        other_airport.land(plane)
        expect { airport.take_off(plane) }.to raise_error 'Cannot take off plane: plane not at this airport'
      end
    end

    context 'when stormy' do
      before do
        allow(weather_reporter).to receive(:stormy?).and_return true
      end

      it 'raises an error' do
        expect { airport.take_off(plane) }.to raise_error 'Cannot take off plane: weather is stormy'
      end
    end
  end

  context 'defaults' do
    subject(:default_airport) { Airport.new(weather_reporter: weather_reporter) }

    it 'has a default capacity' do
      allow(weather_reporter).to receive(:stormy?).and_return false
      Airport::DEFAULT_CAPACITY.times { default_airport.land(plane) }
      expect { default_airport.land(plane) }.to raise_error 'Cannot land plane: airport full'
    end
  end
end