require_relative('instance_counter')
# Класс Station (Станция):
# Имеет название, которое указывается при ее создании
# Может принимать поезда (по одному за раз)
# Может возвращать список всех поездов на станции, находящиеся в текущий момент
# Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
# Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, 
# находящихся на станции).
class Station
  include InstanceCounter
  attr_reader :name
  @@stations = []

  def initialize(name)
    @name = name
    @trains = []
    @@stations << self
    register_instance
  end

  def self.all
    @@stations
  end

  def to_s
    @name
  end

  def get_train(train)
    @trains << train
  end

  def send_train(train)
    @trains.delete(train)
  end

  def list_trains
    @trains.each { |train| puts train.number }
  end
  
  def type_trains
    cargo = @trains.count { |train| train.class == CargoTrain }
    passenger = @trains.count { |train| train.class == PassengerTrain }
    puts "В данный момент на станци находится #{ cargo } грузовых поездов и #{ passenger } пассажирских поездов."
  end
end
       