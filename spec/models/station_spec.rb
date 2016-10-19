require 'rails_helper'

describe Station, type: :model do
  it "has name, distance, fuel type, hours, and address" do
    station = Station.new({
      station_name: "Chad Clancey Fuel Services",
      fuel_type_code: "ELEC",
      street_address: "Your Garage",
      distance: 1.2,
      access_days_time: "Whenever Chad wants"
    })

    expect(station.name).to eq("Chad Clancey Fuel Services")
    expect(station.fuel_type).to eq("Electric")
    expect(station.hours).to eq("Whenever Chad wants")
    expect(station.distance).to eq(1.2)
    expect(station.address).to eq("Your Garage")
  end

  it "has a full address" do
    station = Station.new({
      street_address: "123 Street",
      city: "Denver",
      state: "CO"
    })

    expect(station.full_address).to eq("123 Street, Denver CO")
  end
end
