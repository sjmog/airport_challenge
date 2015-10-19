require 'airport'

describe Airport do
  subject(:no_capacity_airport) { described_class.new(0) }
  subject(:airport_with_capacity) { described_class.new(20) }

  it 'can be created with a capacity' do
    expect { described_class.new(20) }.not_to raise_error
  end

  it 'is full when at capacity' do
    expect(no_capacity_airport).to be_full
  end

  it 'is not full when not at capacity' do
    expect(airport_with_capacity).not_to be_full
  end
end