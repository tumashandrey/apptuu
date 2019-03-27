class RailwayStationsRoute < ActiveRecord::Base
  belongs_to :railway_station
  belongs_to :route

  validates :railway_station_id, uniqueness: { scope: :route_id }
  validates :station_index, uniqueness: { scope: :route_id }

  default_scope { order(:station_index) }

end