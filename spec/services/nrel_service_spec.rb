require 'rails_helper'

describe "NREL API Service" do
  it "finds stations nearby a zipcode" do
    zipcode = "80203"

    result_stations = NRELService.by_location(zipcode)


    expect(result_stations.count).to eq(10)
    expect(result_stations[rand(10)][:distance]).to be < 6.0
  end
end
