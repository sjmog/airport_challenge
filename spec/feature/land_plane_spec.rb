describe 'user stories' do
  let(:plane) { Plane.new }

  context 'when airport not full' do
    let(:airport) { Airport.new(20) }

    it 'lands a plane' do
      expect { plane.land(airport) }.not_to raise_error
    end

    it 'takes off a plane' do
      plane.land(airport)
      expect { plane.take_off }.not_to raise_error
    end
  end

  context 'when airport full' do
    let(:airport) { Airport.new(0) }

    it 'prevents planes landing when airport is full' do
      expect { plane.land(airport) }.to raise_error 'Cannot land: airport full'
    end
  end

  context 'when it is stormy' do
    let(:airport) { Airport.new(20) }

    it 'prevents planes landing' do
      allow(airport).to receive(:stormy?).and_return true
      expect { plane.land(airport) }.to raise_error 'Cannot land: stormy weather'
    end

    it 'prevents planes taking off' do
      plane.land(airport)
      allow(airport).to receive(:stormy?).and_return true
      expect { plane.take_off }.to raise_error 'Cannot take off: stormy weather'
    end
  end
end