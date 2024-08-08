Rails.application.configure do
  config.good_job.execution_mode = :external
  config.good_job.queues = 'default:5'
  config.good_job.enable_cron = true
  config.good_job.smaller_number_is_higher_priority = true
  config.good_job.time_zone = 'Europe/Moscow'

  # Cron jobs
  config.good_job.cron = {
    last_weather_data: {
      cron: "0 * * * *",
      class: "WeatherJob",
      set: { priority: 10 },
      description: "Getting the latest weather data for Moscow"
    }
  }
end
