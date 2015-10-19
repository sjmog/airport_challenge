class Plane
  def land(airport)
    raise 'Cannot land: airport full' if airport.full?
    raise 'Cannot land: stormy weather' if airport.stormy?
    @airport = airport
  end

  def take_off
    raise 'Cannot take off: stormy weather' if @airport.stormy?
  end
end