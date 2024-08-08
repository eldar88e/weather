require 'rails_helper'

RSpec.describe WeatherController, type: :controller do
  let!(:weather_records) { create_list(:weather_record, 5) }

  describe 'GET #current' do
    it 'returns the data of the most recent weather record' do
      get :current
      expect(response).to have_http_status(:success)
      expect(response.body).to eq(weather_records.sort_by { |i| i.datetime }.reverse.first.data.to_json)
    end
  end

  describe 'GET #historical' do
    it 'returns the data of the latest 24 weather records' do
      get :historical
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to match_array(weather_records.pluck(:data))
    end
  end

  describe 'GET #historical_max' do
    it 'returns the maximum temperature of the latest 24 weather records' do
      get :historical_max
      expect(response).to have_http_status(:success)
      expect(response.body.to_f).to eq(weather_records.pluck(:temperature).max)
    end
  end

  describe 'GET #historical_min' do
    it 'returns the minimum temperature of the latest 24 weather records' do
      get :historical_min
      expect(response).to have_http_status(:success)
      expect(response.body.to_f).to eq(weather_records.pluck(:temperature).min)
    end
  end

  describe 'GET #historical_avg' do
    it 'returns the average temperature of the latest 24 weather records' do
      get :historical_avg
      expect(response).to have_http_status(:success)
      temperatures = weather_records.pluck(:temperature)
      average_temp = (temperatures.sum / temperatures.size).round(1)
      expect(response.body.to_f).to eq(average_temp)
    end
  end

  describe 'GET #by_time' do
    let(:time) { (Time.now - 3.hour) }
    let(:timestamp) { time.to_i }

    context 'when a record exists within the time range' do
      it 'returns the weather record' do
        get :by_time, params: { by_time: timestamp }
        expect(response).to have_http_status(:success)
        min_time = time - 30.minutes
        max_time = time + 30.minutes
        expect(response.body).to eq(weather_records.select { |i| i.datetime >= min_time && i.datetime < max_time }
                                                   .first.data.to_json)
      end
    end

    context 'when no record exists within the time range' do
      it 'returns a 404 status' do
        get :by_time, params: { by_time: 0 }
        expect(response).to have_http_status(:not_found)
        expect(response.body).to eq({ status: 404 }.to_json)
      end
    end
  end

  describe 'GET #health' do
    it 'returns OK status' do
      get :health
      expect(response).to have_http_status(:ok)
      expect(response.body).to eq('OK')
    end
  end
end
