class InquiriesController < ApplicationController
  require 'httparty'
  
  def inquiry
    if !session[:user_id].nil?
      user = User.find(session[:user_id])
      airports = user.saved_airports
      @airport_data = []
      airports.each do |airport|
        tsa_data = get_tsa_data airport.airportcode
        faa_data = get_faa_data airport.airportcode
        @airport_data << {:tsa_data => tsa_data,:faa_data => faa_data}
      end
    end
  end
  
  def inquiryresults
    # Get TSA data
    airport = params[:airport]
    tsa_data = get_tsa_data airport
    
    # Get other data from FAA
    faa_data = get_faa_data airport
    
    @airport_data = []
    @airport_data << {:tsa_data => tsa_data,:faa_data => faa_data}
    
  end
  
  def get_tsa_data airportcode
    data = TSAdata.new airportcode
    return data
  end
  
  def get_faa_data airportcode
    data = HTTParty.get("http://services.faa.gov/airport/status/" + airportcode + "?format=json")
    return data
  end
  
  
end
