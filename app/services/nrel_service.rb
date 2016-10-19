class NRELService
  def self.by_location(location)
    response = Faraday.get("https://api.data.gov/nrel/alt-fuel-stations/v1/nearest.json?limit=10&api_key=#{ENV['nrel_api_key']}&radius=6.0&location=80203&fuel_type=ELEC,LPG")
    data = JSON.parse(response.body, symbolize_names: true)
    data[:fuel_stations]
  end
end
