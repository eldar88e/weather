class WeatherRecord < ApplicationRecord
  validates :datetime, presence: true
  validates :temperature, presence: true, numericality: true
  validate :data_structure

  private

  def data_structure
    return if data.is_a?(Hash)

    errors.add(:data, 'Must be a valid JSON object')
  end
end
