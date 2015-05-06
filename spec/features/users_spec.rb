require 'rails_helper'

describe "creating a user" do 
  context "with valid params" do
     
    before do 
      visit root_path
      fill_in "Name", with: "John"
      fill_in "Email", with: "test@email.com"
      fill_in "Password", with: "Password"
      fill_in "Password confirmation", with: "Password"
      click_button "Create User"
    end

    it "tells the user they have signed up" do
      expect(page).to have_content "You have signed up"
    end

    it "sends them to inquiry" do
      expect(current_path).to eq "/inquiry"
    end

  end
end

