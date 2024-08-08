require 'net/http'

class WeatherService
  API_KEY      = 'lFj4Xv8DTumzV5TPAX35i943si1ORBDV'
  LOCATION_KEY = 294021

  def initialize(location_key=nil)
    @location_key = location_key || LOCATION_KEY
  end

  def self.call
    new.connect_to
  end

  def connect_to(url=nil)
    url = "https://dataservice.accuweather.com/currentconditions/v1/#{@location_key}/historical/24?apikey=#{API_KEY}"
    uri = URI url
    Net::HTTP.get_response uri
  end
end