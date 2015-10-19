require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  it { is_expected.to respond_to(:land).with(1).argument }

  it 'raises an error if airport is full' do
    airport = double(:airport, full?: true)
    expect { plane.land(airport) }.to raise_error 'Cannot land: airport full'
  end

  it { is_expected.to respond_to :take_off }
end