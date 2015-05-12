class SavedAirportsController < ApplicationController
  
  def create
		@saved_airport = SavedAirport.new(saved_airport_params)
		if @saved_airport.save
			redirect_to inquiry_path, notice: "Airport Added"
		else
			redirect_to inquiry_path, notice: "Airport Failed to Add"
		end
	end

  def destroy
      airport = SavedAirport.find(params[:id])
      unless airport.nil?
        airport.destroy
      end
      redirect_to inquiry_path, notice: "Airport Removed" 
  end

	private

		def saved_airport_params
			params.require(:saved_airport).permit(:user_id, :airportcode)
		end
end
