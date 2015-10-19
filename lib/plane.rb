class Plane

  def initialize
    @flying = true
    @airport = nil
  end

  def take_off
    raise 'Plane cannot take off: plane already flying' if @flying
    @flying = true
  end

  def land(airport)
    raise 'Plane cannot land: plane already landed' if !@flying
    @airport = airport
    @flying = false
  end

  def airport
    raise 'Plane cannot be at an airport: plane already flying' if @flying
    @airport
  end
end