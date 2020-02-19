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
    "#{lat_long[0]} #{lat_long[1]}"
end

get "/news" do
  # do everything else
end