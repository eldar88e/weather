Rails.application.routes.draw do
  scope '/weather' do
    get 'current', to: 'weather#current'
    get 'historical', to: 'weather#historical'
    get 'historical/max', to: 'weather#historical_max'
    get 'historical/min', to: 'weather#historical_min'
    get 'historical/avg', to: 'weather#historical_avg'
    get ':by_time', to: 'weather#by_time'
  end

  get '/health', to: 'weather#health'

  root "weather#current"

  mount GoodJob::Engine => 'good_job'
end
