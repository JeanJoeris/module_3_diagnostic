require 'rails_helper'

describe "Search for alt-fuel stations" do
  it "finds alt-fuel stations by zip code" do
    # As a user
    # When I visit "/"
    # And I fill in the search form with 80203
    # And I click "Locate"
    # Then I should be on page "/search" with parameters visible in the url
    # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
    # And the stations should be limited to Electric and Propane
    # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
    VCR.use_cassette("search_by_location") do
      visit root_path

      fill_in "q", with: "80203"

      click_on "Locate"

      expect(current_path).to eq("/search")
      10.times do |i|
        within("div#station-#{i}") do
          expect(page).to have_content("#{i + 1}) -")
          expect(page).to (have_content("Fuel type: ELEC") || have_content("Fuel type: LPG"))
          expect(page).to have_content("Name")
          expect(page).to have_content("Address")
          expect(page).to have_content("Distance")
          expect(page).to have_content("Access Times")
        end
      end
    end
  end
end
