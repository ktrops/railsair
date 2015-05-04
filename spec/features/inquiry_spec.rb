require 'spec_helper'

describe "initiating an inquiry" do
    
    it "should accept an airport code on the inquiry page" do
      visit "/inquiry"
      expect(page).to have_content("Get Security Wait Times")
      expect(page).to have_button("Get Info")
    end
    
    it "should return airport information" do
      visit "/inquiry"
      fill_in "airport", with: "SEA"
      click_button "Get Info"
      expect(page).to have_content "Seattle-Tacoma International"
      expect(page).to have_content "Local"
    end
  
  end
