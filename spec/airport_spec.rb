require 'Airport'
require 'Plane'

describe Airport do
  it 'can instruct a plane to land at the airport' do
    airport = Airport.new(3)
    airport.weatherSetter("sunny")
    total = airport.planes.count
    airport.landPlane("BA123")
    expect(airport.planes.count).to be > total
  end

  it 'can instruct a specific plane to take off' do
    airport = Airport.new(3)
    airport.weatherSetter("sunny")
    airport.landPlane("CX123")
    total = airport.planes.count
    airport.takeOff("CX123")
    expect(airport.planes.count).to be < total
  end

  it 'prevents takeoffs when the weather is stormy' do
    airport = Airport.new(3)
    airport.landPlane("CX123")
    total = airport.planes.count
    airport.weatherSetter("stormy")
    airport.takeOff("CX123")
    expect(airport.planes.count).to eq(total)
  end

  it 'prevents landing when the weather is stormy' do
    airport = Airport.new(3)
    airport.weatherSetter("stormy")
    total = airport.planes.count
    airport.landPlane("CX123")
    expect(airport.planes.count).to eq(total)
  end

  it 'prevents landing when the airport is full' do
    airport = Airport.new(3)
    airport.weatherSetter("sunny")
    3.times do
      plane = Plane.new
      airport.landPlane(plane)
    end
    expect { airport.landPlane("test") }.to raise_error 'Airport full'
  end

  describe Plane do
    it 'receives instructions to land' do
      plane = Plane.new
      airport = Airport.new(2)
      airport.weatherSetter("sunny")
      puts airport.planes
      total = airport.planes.count
      plane.landInstruct(airport)
      puts total
      expect(airport.planes.count).to be > total
    end
  end

end
