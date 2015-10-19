class Plane
  def land(airport)
    raise 'Cannot land: airport full' if airport.full?
  end

  def take_off
  end
end