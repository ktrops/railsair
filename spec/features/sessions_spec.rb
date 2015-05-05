require 'spec_helper'

describe "logging in" do
    
    it "should show a sign in link on the home page" do
      visit "/"
      expect(page).to have_link("Sign In")
    end
    
    it "link should take you to the sign in page" do
      visit "/"
      click_link "Sign In"
      expect(page).to have_content("Sign In")
    end
  
  end
