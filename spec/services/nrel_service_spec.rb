require 'rails_helper'

describe "NREL API Service" do
  it "finds stations nearby a zipcode" do
    VCR.use_cassette("search_by_location") do
      zipcode = "80203"

      result_stations = NRELService.by_location(zipcode)
      first_station = result_stations.first

      expect(first_station[:street_address]).to eq("800 Acoma St")
      expect(result_stations.count).to eq(10)
      result_stations.each do |station|
        expect(station[:distance]).to be < 6.0
        expect(station[:city]).to eq("Denver")
        expect(station[:fuel_type_code]).to be_in(%w(ELEC LPG))
      end
    end
  end
end
