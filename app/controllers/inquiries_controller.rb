class InquiriesController < ApplicationController
  require 'httparty'
  def inquiry
  end
  
  def inquiryresults
    # Get TSA data
    airport = params[:airport]
    @tsa_data = TSAdata.new airport
    
    # Get other data from FAA
    @faa_data = HTTParty.get("http://services.faa.gov/airport/status/" + airport + "?format=json")
    
  end
  
end
