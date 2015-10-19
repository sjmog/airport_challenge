require 'airport'
require 'plane'

describe 'User Stories' do

  context 'when not stormy' do
    before do
      allow(Kernel).to receive(:rand).and_return 1
    end

    # As an air traffic controller
    # So planes can land safely at my airport
    # I would like to instruct a plane to land
    it 'so planes land at airports, instruct a plane to land' do
      airport = Airport.new(20)
      plane = Plane.new
      allow(airport).to receive(:stormy?).and_return false
      expect { airport.land(plane) }.not_to raise_error
    end

    # As an air traffic controller
    # So planes can take off safely from my airport
    # I would like to instruct a plane to take off
    it 'so planes take off from airports, instruct a plane to take off' do
      airport = Airport.new(20)
      plane = Plane.new
      expect { airport.take_off(plane) }.not_to raise_error
    end

    # As an air traffic controller
    # So that I can avoid collisions
    # I want to prevent airplanes landing when my airport if full
    it 'does not allow planes to land when airport is full' do
      airport = Airport.new(20)
      allow(airport).to receive(:stormy?).and_return false
      plane = Plane.new
      20.times do
        airport.land(plane)
      end
      expect { airport.land(plane) }.to raise_error 'Cannot land plane: airport full'
    end
  end

  # As an air traffic controller
  # So that I can avoid accidents
  # I want to prevent airplanes landing or taking off when the weather is stormy
  context 'when stormy' do
    before do
      allow(Kernel).to receive(:rand).and_return 6
    end
    
    it 'does not allow planes to land' do
      airport = Airport.new(20)
      plane = Plane.new
      allow(airport).to receive(:stormy?).and_return true
      expect { airport.land(plane) }.to raise_error 'Cannot land plane: weather is stormy'
    end
  end
end