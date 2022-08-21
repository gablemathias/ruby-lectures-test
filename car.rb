class Car
  def initialize
    @engine_started = false
  end

  def engine_started?
    return @engine_started
  end

  def start_engine
    @engine_started = true
  end
end

my_car = Car.new
your_car = Car.new
my_car.engine_started? #=> false
my_car.start_engine
my_car.engine_started? #=> true


