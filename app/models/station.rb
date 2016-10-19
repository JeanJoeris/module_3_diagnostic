class Station
  def initialize(raw_station_data)
    @data = raw_station_data
  end

  def name
    data[:station_name]
  end

  def fuel_type
    return "Electric" if data[:fuel_type_code] == "ELEC"
    return "Propane" if data[:fuel_type_code] == "LPG"
  end

  def hours
    data[:access_days_time]
  end

  def distance
    data[:distance]
  end

  def address
    data[:street_address]
  end

  private
    attr_reader :data
end