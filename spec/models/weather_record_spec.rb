require 'rails_helper'

RSpec.describe WeatherRecord, type: :model do
  before do
    @valid_attributes = {
      datetime: Time.now,
      temperature: 20.0,
      data: { description: 'Sunny' }
    }
  end

  it "is valid with valid attributes" do
    weather_record = WeatherRecord.new(@valid_attributes)
    expect(weather_record).to be_valid
  end

  it "is not valid without a datetime" do
    weather_record = WeatherRecord.new(@valid_attributes.merge(datetime: nil))
    expect(weather_record).not_to be_valid
    expect(weather_record.errors[:datetime]).to include("can't be blank")
  end

  it "is not valid without a temperature" do
    weather_record = WeatherRecord.new(@valid_attributes.merge(temperature: nil))
    expect(weather_record).not_to be_valid
    expect(weather_record.errors[:temperature]).to include("can't be blank")
  end

  it "is not valid with a non-numeric temperature" do
    weather_record = WeatherRecord.new(@valid_attributes.merge(temperature: 'abc'))
    expect(weather_record).not_to be_valid
    expect(weather_record.errors[:temperature]).to include("is not a number")
  end

  it "is not valid with an invalid data structure" do
    weather_record = WeatherRecord.new(@valid_attributes.merge(data: 'invalid json'))
    expect(weather_record).not_to be_valid
    expect(weather_record.errors[:data]).to include("Must be a valid JSON object")
  end

  it "is valid with a valid JSON data structure" do
    weather_record = WeatherRecord.new(@valid_attributes)
    expect(weather_record).to be_valid
  end
end