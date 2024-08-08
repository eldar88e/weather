require 'rails_helper'

RSpec.describe WeatherService, type: :service do
  describe '#connect_to' do
    let(:weather_service) { WeatherService.new }
    let(:api_key) { WEATHER_API_KEY }
    let(:url) { "https://dataservice.accuweather.com/currentconditions/v1/294021/historical/24?apikey=#{api_key}" }

    before do
      stub_request(:get, url)
        .to_return(status: 200, body: '{"key": "value"}', headers: { 'Content-Type' => 'application/json' })
    end

    it 'makes a GET request to the correct URL' do
      response = weather_service.connect_to
      expect(response.code).to eq("200")
      expect(response.body).to eq('{"key": "value"}')
    end

    it 'returns a Net::HTTP response' do
      response = weather_service.connect_to
      expect(response).to be_a(Net::HTTPResponse)
    end
  end

  describe '.call' do
    it 'calls the connect_to method' do
      allow_any_instance_of(WeatherService).to receive(:connect_to).and_return(Net::HTTPResponse.new(1.0, 200, 'OK'))
      response = WeatherService.call
      expect(response).to be_a(Net::HTTPResponse)
    end
  end
end
