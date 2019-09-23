require_relative 'Plane'


class Airport

  attr_reader :planes
  attr_reader :weather
  attr_reader :capacity

  def initialize(capacity)
    @planes = []
    @weather = "Sunny"
    @capacity = capacity
  end


  def weatherGenerator
    randomNumber = rand(1..5)
    if randomNumber == 1
      @weather = "stormy"
    else
      @weather = "sunny"
    end
  end

  def landPlane(plane)
  if @weather == "sunny"
    fail 'Airport full' if @planes.count >= @capacity
    @planes << plane

  else
    puts "Planes are not allowed to land in stormy weather!"
    end
  end

  def takeOff(plane)
    if @weather ==  "sunny"
      fail 'No planes available' if @planes.empty?
      @planes.pop

    elsif @weather == "stormy"
    puts "Planes are not allowed to take off in stormy weather!"
    end
  end


  def weatherSetter(weather)
    @weather = weather
  end

end
