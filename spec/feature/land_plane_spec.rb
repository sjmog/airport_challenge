describe 'user stories' do
  context 'airport not full' do
    let(:airport) { Airport.new(20) }

    it 'lands a plane' do
      plane = Plane.new
      expect { plane.land(airport) }.not_to raise_error
    end

    it 'takes off a plane' do
      plane = Plane.new
      expect { plane.take_off }.not_to raise_error
    end
  end

  context 'airport full' do
    let(:airport) { Airport.new(0) }

    it 'prevents planes landing when airport is full' do
      plane = Plane.new
      expect { plane.land(airport) }.to raise_error 'Cannot land: airport full'
    end
  end
end