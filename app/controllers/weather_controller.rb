class WeatherController < ApplicationController
  before_action :set_weather, except: [:by_time, :health]
  before_action :check_weather, except: [:by_time, :health]

  def current
    render json: @weathers.first.data
  end

  def historical
    render json: @weathers.limit(24).pluck(:data)
  end

  def historical_max
    render json: @weathers.limit(24).pluck(:temperature).max
  end

  def historical_min
    render json: @weathers.limit(24).pluck(:temperature).min
  end

  def historical_avg
    weathers = @weathers.limit(24).pluck(:temperature)
    render json: (weathers.sum / weathers.length).round(1)
  end

  def by_time
    by_time = params[:by_time].size > 9 && params[:by_time].size < 11 ? params[:by_time].to_i : 0
    time    = Time.at(by_time)
    time    = time.utc unless Rails.env.test?
    return render json: { status: 404 }, status: 404 if time.year == 1970

    min_time = time - 30.minutes
    max_time = time + 30.minutes
    @weather = WeatherRecord.where('datetime >= ? AND datetime < ?', min_time, max_time).first

    render json: @weather ? @weather.data : { status: 404 }, status: @weather ? 200 : 404
  end

  def health
    render plain: "OK"
  end

  private

  def set_weather
    @weathers = WeatherRecord.order(datetime: :desc)
  end

  def check_weather
    if @weathers.blank?
      WeatherJob.perform_later

      return render(
        json: { error: 'Database is empty! The Weather job has been launched to fill the DB with the latest data.' },
        status: 404
      )
    end
  end
end
