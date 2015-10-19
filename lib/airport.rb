class Airport
  def initialize(capacity)
    @capacity = capacity
  end

  def full?
    @capacity.zero?
  end
end