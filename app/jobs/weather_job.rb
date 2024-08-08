class WeatherJob < ApplicationJob
  def perform
    response = WeatherService.call
    raw_data = response.body
    data     = JSON.parse(raw_data)
    data.each do |item|
      datetime = Time.parse(item['LocalObservationDateTime'])
      WeatherRecord.create(datetime: datetime,
                           temperature: item['Temperature']['Metric']['Value'],
                           data: item) unless WeatherRecord.exists?(datetime: datetime)
    end
  end
end