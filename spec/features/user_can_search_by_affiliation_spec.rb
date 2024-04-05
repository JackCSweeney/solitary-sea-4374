require 'rails_helper'

RSpec.describe "Avatar API Search by Affiliation" do
  describe 'As a visitor' do
    it 'can search by affiliation and see the first 25 members of that affiliation along with detailed information about each of them' do
      # As a user, When I visit "/"
      visit '/'
      # And I Select "Fire Nation" from the select field
      select "Fire Nation", from: "nation"
      # (Note: Use the existing select field)
      # And I click "Search For Members"
      click_on "Search For Members"
      # Then I should be on page "/search"
      expect(current_path).to eq("/search")
      # Then I should see the total number of people who live in the Fire Nation. (should be close to 100)
      expect(page).to have_content("Search Results: 97")
      # And I should see a list with the detailed information for the first 25 members of the Fire Nation.
      within ".search_results" do
        expect(page).to have_css("#character", count: 25)
        expect(page).to have_css("img", count: 25)
        expect(page).to have_content("Name:", count: 25)
        expect(page).to have_content("Allies:", count: 25)
        expect(page).to have_content("Enemies:", count: 25)
        expect(page).to have_content("Affiliations:", count: 25)
      # And for each of the members I should see:
        within first("#character") do
      # - The name of the member (and their photo, if they have one)
          expect(page).to have_content("Name: Azula")
          expect(page).to have_css("img")
      # - The list of allies or "None"
          expect(page).to have_content("Allies: Ozai, Zuko")
      # - The list of enemies or "None"
          expect(page).to have_content("Enemies: Iroh, Zuko, Kuei, Long Feng, Mai, Ty Lee, Ursa")
      # - Any affiliations that the member has
          expect(page).to have_content("Affiliations: Azula's team (formerly) Dai Li (formerly) Fire Nation Fire Nation Royal Family Fire Warriors Royal Fire Academy for Girls (formerly)")
        end
      end
    end
  end
end