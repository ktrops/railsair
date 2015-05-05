class SavedAirportsController < ApplicationController
  
  def create
		@saved_airport = SavedAirport.new(saved_airport_params)
		if @saved_airport.save
			redirect_to inquiry_path, notice: "Airport Added"
		else
			redirect_to inquiry_path, notice: "Airport Failed to Add"
		end
	end

	private

		def saved_airport_params
			params.require(:saved_airport).permit(:user_id, :airportcode)
		end
end
