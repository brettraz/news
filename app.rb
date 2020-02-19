require "sinatra"
require "sinatra/reloader"
require "geocoder"
require "forecast_io"
require "httparty"
def view(template); erb template.to_sym; end
before { puts "Parameters: #{params}" }                                     

# enter your Dark Sky API key here
ForecastIO.api_key = "03d21ffdf385dfb8376360cc6d085591"

get "/" do
  # show a view that asks for the location

   
   

    
  view "geocode"
end

get "/map" do
    results = Geocoder.search(params["q"])
    lat_long = results.first.coordinates # => [lat, long]
    "#{lat_long[0]}, #{lat_long[1]}"
    #coordinates= "#{lat_long[0]}, #{lat_long[1]}"
end

#  get "/weather" do

# results = Geocoder.search(params["q"])
# lat_long = results.first.coordinates # => [lat, long]
#  forecast = ForecastIO.forecast(lat_long[0], lat_long[1]).to_hash
#  pp forecast
#  end

get "/news" do
  # do everything else
url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=cb52b1ae35d447ea9481b307ce9e4799"
news = HTTParty.get(url).parsed_response.to_hash
#news = HTTParty.get(url).params["q"].to_hash
# news is now a Hash you can pretty print (pp) and parse for your output
end