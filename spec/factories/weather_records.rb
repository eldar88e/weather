FactoryBot.define do
  factory :weather_record do
    sequence :datetime do |n|
      Time.zone.now - (n - 1).hours + 1.day
    end
    temperature { Faker::Number.decimal(l_digits: 2) }
    data do
      {
        "LocalObservationDateTime": datetime,
        "EpochTime": datetime.to_i,
        "WeatherText": ['Clear', 'Mostly cloudy', 'Sunny', 'Partly sunny'].sample,
        "WeatherIcon": 33,
        "HasPrecipitation": false,
        "PrecipitationType": nil,
        "IsDayTime": false,
        "Temperature": {
          "Metric": {
            "Value": temperature,
            "Unit": "C",
            "UnitType": 17
          }
        }
      }
    end
  end
end
