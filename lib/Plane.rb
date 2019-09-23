class Plane
  attr_reader :airborne

  def initialize
    @airborne = "Yes"
  end

  
  def landInstruct(airport)
    airport.landPlane(self)
  end

  def flyInstruct (airport)
    airport.takeOff(self)
  end

end
