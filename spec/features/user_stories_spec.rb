require 'airport'
require 'plane'

describe 'User Stories' do
  let(:airport) { Airport.new(20, WeatherReporter.new) }
  let(:plane) { Plane.new }

  context 'when not stormy' do
    before do
      allow_any_instance_of(WeatherReporter).to receive(:stormy?).and_return false
    end

    # As an air traffic controller
    # So planes can land safely at my airport
    # I would like to instruct a plane to land
    it 'so planes land at airports, instruct a plane to land' do
      allow(airport).to receive(:stormy?).and_return false
      expect { airport.land(plane) }.not_to raise_error
    end

    # As an air traffic controller
    # So planes can take off safely from my airport
    # I would like to instruct a plane to take off
    it 'so planes take off from airports, instruct a plane to take off' do
      expect { airport.take_off(plane) }.not_to raise_error
    end

    # As an air traffic controller
    # So that I can avoid collisions
    # I want to prevent airplanes landing when my airport if full
    it 'does not allow planes to land when airport is full' do
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
      allow_any_instance_of(WeatherReporter).to receive(:stormy?).and_return true
    end

    it 'does not allow planes to land' do
      expect { airport.land(plane) }.to raise_error 'Cannot land plane: weather is stormy'
    end

    it 'does not allow planes to take off' do
      expect { airport.take_off(plane) }.to raise_error 'Cannot take off plane: weather is stormy'
    end
  end
end