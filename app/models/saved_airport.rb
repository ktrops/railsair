class SavedAirport < ActiveRecord::Base
  belongs_to :user
  
	validates :airportcode, presence: true, length: { maximum: 3, minimum: 3 }
  
end
