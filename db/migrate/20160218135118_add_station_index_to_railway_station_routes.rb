class AddStationIndexToRailwayStationRoutes < ActiveRecord::Migration
  def change
    change_table :railway_stations_routes do |t|
      t.integer :station_index
    end
  end
end
