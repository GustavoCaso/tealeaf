class MyCar

  attr_accessor :year, :color, :model


  def initialize(year,color,model)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def speed_up
    @spedd += 10
  end

  def brake
    @speed -=5
  end

  def shut_off
    @speed = 0
  end

  def spray_paint(color)
    @color = color
  end

  def calculate_gas (miles, gallons)
    miles / gallons
  end

  def to_s
    "The car model is: #{model}, I bought it #{color}, and the year of manufacturing is #{year}"
  end



end