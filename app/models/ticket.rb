class Ticket < ActiveRecord::Base
  belongs_to :train
  belongs_to :user
  belongs_to :start_station, class_name: 'RailwayStation', foreign_key: :railway_station_start_id
  belongs_to :end_station, class_name: 'RailwayStation', foreign_key: :railway_station_end_id

  validates :number, presence: true
  validates :user_name, presence: true
  validates :railway_station_start_id, presence: true
  validates :railway_station_end_id, presence: true
end