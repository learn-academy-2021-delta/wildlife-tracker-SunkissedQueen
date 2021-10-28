class ChangeLatitudeToBeStringSightings < ActiveRecord::Migration[6.1]
  def change
    change_column :sightings, :latitude, :string
    change_column :sightings, :longitude, :string
  end
end
