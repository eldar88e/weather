require 'net/http'

class WeatherService
  def initialize(location_key=nil)
    @location_key = location_key || 294021 # 294021 - Moscow
  end

  def self.call
    new.connect_to
  end

  def connect_to(url=nil)
    path = "/currentconditions/v1/#{@location_key}/historical/24?apikey=#{WEATHER_API_KEY}"
    uri  = URI 'https://dataservice.accuweather.com' + path
    Net::HTTP.get_response uri
  end
end