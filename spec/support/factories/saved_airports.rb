FactoryGirl.define do
  
  factory :saved_airport do
    airportcode {["SEA","ORD","JFK","DEN","PDX"].sample}
  end

end
