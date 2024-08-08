class CreateWeatherRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :weather_records do |t|
      t.datetime :datetime
      t.float :temperature
      t.json :data

      t.timestamps
    end

    add_index :weather_records, :datetime, unique: true
  end
end
