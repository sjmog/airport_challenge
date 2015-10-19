require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  describe '#land' do
    context 'when airport is full' do
      it 'raises an error' do
        airport = double(:airport, full?: true)
        expect { plane.land(airport) }.to raise_error 'Cannot land: airport full'
      end
    end
    
    context 'when it is stormy' do
      it 'raises an error' do
        airport = double(:airport, full?: false, stormy?: true)
        expect { plane.land(airport) }.to raise_error 'Cannot land: stormy weather'
      end
    end
  end

  describe '#take_off' do
    context 'when it is stormy' do
      it 'raises an error' do
        airport = double(:airport, full?: false, stormy?: false)
        plane.land(airport)
        allow(airport).to receive(:stormy?).and_return(true)
        expect { plane.take_off }.to raise_error 'Cannot take off: stormy weather'
      end
    end
  end
end