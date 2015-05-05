require 'spec_helper'

describe "logging in" do
  
    let(:user) { create(:user) }
    
    it "should show a sign in link on the home page" do
      visit "/"
      expect(page).to have_link("Sign In")
    end
    
    it "link should take you to the sign in page" do
      visit "/"
      click_link "Sign In"
      expect(page).to have_content("Sign In")
    end
    
    it "after sign in page should take you to the homepage and be signed in" do
      visit "/"
      click_link "Sign In"
      fill_in 'Email', with: user.email
      fill_in 'Password', with: "password"
      click_button 'Sign In'
      expect(page).to have_content "Sign Out"
      expect(page).to have_content "You have been logged in."
      expect(page).to have_text("Airport Info for", count: 3)
    end
    
  
  end
